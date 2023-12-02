//===----------------------------------------------------------------------===//
//
/// A register allocator simplified from RegAllocFast.cpp
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegAllocRegistry.h"
#include "llvm/CodeGen/RegisterClassInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"

#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/SlotIndexes.h"

#include <map>
#include <set>
#include <queue>

using namespace llvm;

#define DEBUG_TYPE "regalloc"

STATISTIC(NumStores, "Number of stores added");
STATISTIC(NumLoads , "Number of loads added");

namespace {
  /// This is class where you will implement your register allocator in
  class RegAllocSimple : public MachineFunctionPass {
  public:
    static char ID;
    RegAllocSimple() : MachineFunctionPass(ID) {}

  private:
    /// Some information that might be useful for register allocation
    /// They are initialized in runOnMachineFunction
    MachineFrameInfo *MFI;
    MachineRegisterInfo *MRI;
    const TargetRegisterInfo *TRI;
    const TargetInstrInfo *TII;
    RegisterClassInfo RegClassInfo;

    // TODO: maintain information about live registers
    std::map<Register, std::pair<std::pair<MCRegister, unsigned int>, MachineOperand*>> LiveVirtRegs;
    std::set<MCRegister> PreColoredPhysRegs;
    std::set<MCRegister> UsedInInstr;
    std::map<Register, int> SpillMap;

    // Below are preprocessed information used in register allocation optimization
    std::map<Register, int> UseCount;
    std::map<Register, std::deque<MachineInstr*>> NextUse;

  public:
    StringRef getPassName() const override { return "Simple Register Allocator"; }

    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesCFG();
      // At -O1/-O2, llc fails to schedule some required passes if this pass
      // does not preserve these anlyses; these are preserved by recomputing
      // them at the end of runOnFunction(), you can safely ignore these
      AU.addRequired<LiveIntervals>();
      AU.addPreserved<LiveIntervals>();
      AU.addRequired<SlotIndexes>();
      AU.addPreserved<SlotIndexes>();
      MachineFunctionPass::getAnalysisUsage(AU);
    }

    /// Ask the Machine IR verifier to check some simple properties
    /// Enabled with the -verify-machineinstrs flag in llc
    MachineFunctionProperties getRequiredProperties() const override {
      return MachineFunctionProperties().set(
          MachineFunctionProperties::Property::NoPHIs);
    }

    MachineFunctionProperties getSetProperties() const override {
      return MachineFunctionProperties().set(
          MachineFunctionProperties::Property::NoVRegs);
    }

    MachineFunctionProperties getClearedProperties() const override {
      return MachineFunctionProperties().set(
        MachineFunctionProperties::Property::IsSSA);
    }

  private:

    void setMachineOperandToPhysReg(MachineOperand &MO, Register PhysReg) {
      unsigned SubRegIdx = MO.getSubReg();
      if (SubRegIdx != 0) {
        PhysReg = TRI->getSubReg(PhysReg, SubRegIdx);
        MO.setSubReg(0);
      }
      MO.setReg(PhysReg);
      if (MO.isKill()) {
        MO.setIsKill(false);
      } else if (MO.isDead()) {
        MO.setIsDead(false);
      }
      MO.setIsRenamable();
    }

    int allocateOrFindStackSlot(Register r) {
      if (SpillMap.count(r)) {
        return SpillMap[r];
      }
      const TargetRegisterClass* RC = MRI->getRegClass(r);
      unsigned int spill_size = TRI->getSpillSize(*RC);
      Align spill_alignment = TRI->getSpillAlign(*RC);
      int new_slot = MFI->CreateSpillStackObject(spill_size, spill_alignment);
      SpillMap[r] = new_slot;
      return new_slot;
    }

    bool isPhysRegUnused(MCRegister candidate) {
      // candidate cannot be already allocated to the same instruction
      bool no_conflict_in_curr_instr = true;
      for (MCRegister reg : UsedInInstr) {
        if (TRI->regsOverlap(reg, candidate)) {
          no_conflict_in_curr_instr = false;
          break;
        }
      }
      // candidate cannot be one of the pre-colored registers
      bool no_conflict_in_precolored = true;
      for (MCRegister reg : PreColoredPhysRegs) {
        if (TRI->regsOverlap(reg, candidate)) {
          no_conflict_in_precolored = false;
          break;
        }
      }
      // candidate cannot be one of the live register
      bool no_conflict_in_live_phys = true;
      for (auto& kv : LiveVirtRegs) {
        MCRegister prev_alloced = kv.second.first.first;
        unsigned int prev_subred_index = kv.second.first.second;
        if (prev_subred_index) {
          prev_alloced = TRI->getSubReg(prev_alloced, prev_subred_index);
        }
        if (TRI->regsOverlap(prev_alloced, candidate)) {
          no_conflict_in_live_phys = false;
          break;
        }
      }
      return no_conflict_in_curr_instr && no_conflict_in_precolored && no_conflict_in_live_phys;
    }

    // Find the corresponding virtual register currently residing in the p_subreg.
    // If not found, return 0
    Register findVirtRegInPhysReg(MCRegister p_subreg) {
      for (auto& kv : LiveVirtRegs) {
        Register v_reg = kv.first;
        auto& p_reg_info = kv.second.first;
        MCRegister prev_alloced_p_reg = p_reg_info.first;

        unsigned int prev_subred_index = p_reg_info.second;
        if (prev_subred_index) {
          prev_alloced_p_reg = TRI->getSubReg(prev_alloced_p_reg, prev_subred_index);
        }

        if (TRI->regsOverlap(prev_alloced_p_reg, p_subreg)) {
          return v_reg;
        }
      }
      // Return 0 if not found
      return 0;
    }

    void spillVirtReg(Register v_reg_to_spill, MachineBasicBlock::iterator insert_before) {
      // Error guard
      if (!LiveVirtRegs.count(v_reg_to_spill)) {
        dbgs() << "[spillVirtReg]: Cannot spill a non-live virtual register" << '\n';
        return;
      }
      // If clean and previously spilled, skip
      auto& p_reg_info = LiveVirtRegs[v_reg_to_spill];
      MachineOperand& MO = *p_reg_info.second;
      if (MO.isUse() && SpillMap.count(v_reg_to_spill)) {
        LiveVirtRegs.erase(v_reg_to_spill);
        return;
      }
      // If not used anymore, do not need to save on stack
      if (MO.isKill() || MO.isDead()) {
        LiveVirtRegs.erase(v_reg_to_spill);
        return;
      }
      // MachineInstr* MI = MO.getParent();
      MachineBasicBlock* MBB = insert_before->getParent();
      int slot = allocateOrFindStackSlot(v_reg_to_spill); // isSpillMap must be false given the above guarding check
      MCRegister p_reg_to_spill = p_reg_info.first.first;
      if (p_reg_info.first.second) {
        p_reg_to_spill = TRI->getSubReg(p_reg_to_spill, p_reg_info.first.second);
      }
      // MCRegister p_reg_to_spill = LiveVirtRegs[v_reg_to_spill].first;
      const TargetRegisterClass* RC = MRI->getRegClass(v_reg_to_spill);
      TII->storeRegToStackSlot(*MBB, insert_before, p_reg_to_spill, p_reg_info.second->isKill(), slot, RC, TRI);
      NumStores++; 
      LiveVirtRegs.erase(v_reg_to_spill);
    }

    MCRegister spillOneRegAndRetrivePosition(MachineOperand& MO, llvm::ArrayRef<llvm::MCPhysReg> AllocationOrder) {
      // If no physical register can be used
      std::map<Register, MCRegister> candidate_pool;
      for (MCRegister candidate : AllocationOrder) {
        MCRegister candidate_subreg = candidate;
        if (MO.getSubReg()) {
          candidate_subreg = TRI->getSubReg(candidate_subreg, MO.getSubReg());
        }
        Register v_reg_in_p_reg = findVirtRegInPhysReg(candidate_subreg);
        if (v_reg_in_p_reg == 0) {
          continue;
        }
        bool used_in_same_instr = false;
        for (MCRegister reg : UsedInInstr) {
          if (TRI->regsOverlap(reg, candidate_subreg)) {
            used_in_same_instr = true;
            break;
          }
        }
        if (!used_in_same_instr) {
          candidate_pool[v_reg_in_p_reg] = candidate;
        }
      }

      //* 3rd Option (Optimization): Choose from candidates based on farthest next appearance
      Register v_to_spill;
      int farthest_distance = INT_MIN;
      MCRegister available_p_reg;
      MachineInstr* curr_instr = MO.getParent();
      MachineBasicBlock& MBB = *curr_instr->getParent();
      for (auto& v_p_pair : candidate_pool) {
        Register r = v_p_pair.first;
        MCRegister mcr = v_p_pair.second;
        bool has_next_use = NextUse[r].size();
        if (!has_next_use) {
          v_to_spill = r;
          available_p_reg = mcr;
          break;
        }
        MachineInstr* next_use_instr = NextUse[r].front();
        // figure out how far is next_use_instr from curr_instr
        int distance = -1;
        for (MachineInstr& it : MBB) {
          if (&it != curr_instr && distance == -1) {
            continue;
          } else if (&it == curr_instr) {
            distance = 0;
          } else if (&it == next_use_instr) {
            break;
          } else if (&it != curr_instr) {
            distance ++;
          }
        }
        if (distance > farthest_distance) {
          farthest_distance = distance;
          v_to_spill = r;
          available_p_reg = mcr;
        }
      }
      return available_p_reg;
      
      //* 2nd Option(Optimization): Based on lowest use count in current basic block
      // int min_use_count = INT_MAX;
      // Register v_to_spill;
      // MCRegister available_p_reg;
      // for (auto& [r, mcr] : candidate_pool) {
      //   int use_count = UseCount.count(r) ? UseCount[r] : 0;
      //   if (use_count < min_use_count) {
      //     v_to_spill = r;
      //     available_p_reg = mcr;
      //     min_use_count = use_count;
      //   }
      // }
      // spillVirtReg(v_to_spill, MO.getParent());
      // return available_p_reg;


      //* 1st Option(Greedy): Always choose first one - good but not good enough
      // spillVirtReg(candidate_pool.begin()->first, MO.getParent());
      // return candidate_pool.begin()->second;
      
    }

    /// Allocate physical register for virtual register operand
    MCRegister allocateOperand(MachineOperand &MO, Register VirtReg, bool is_use) {
      // allocate physical register for a virtual register
      // If already allocated and still alive, just use it
      if (LiveVirtRegs.count(VirtReg)) {
        // Maintain NextUse
        NextUse[VirtReg].pop_front();
        return LiveVirtRegs[VirtReg].first.first;
      }
      // Try to find an unused Phys Reg
      bool found = false;
      MCRegister available_p_reg;
      const TargetRegisterClass* RC = MRI->getRegClass(VirtReg);
      auto AllocationOrder = RegClassInfo.getOrder(RC);

      for (MCRegister candidate : AllocationOrder) {
        MCRegister candidate_subreg = candidate;
        if (MO.getSubReg()) {
          candidate_subreg = TRI->getSubReg(candidate_subreg, MO.getSubReg());
        }
        bool is_unused = isPhysRegUnused(candidate_subreg);
        if (is_unused) {
          found = true;
          available_p_reg = candidate;
          break;
        }
      }
      // If no physical register can be used
      if (!found) {
        available_p_reg = spillOneRegAndRetrivePosition(MO, AllocationOrder);
      }
      // If we are using a virtual register and it's not already live,
      // it must have been spilled into the stack.
      // So we reload the value here.
      if (is_use && !MO.isKill() && !MO.isDead()) {
        int slot = allocateOrFindStackSlot(VirtReg);
        // Insert loading instruction: P = load slot
        MachineInstr* MI = MO.getParent();
        MachineBasicBlock* MBB = MI->getParent();
        TII->loadRegFromStackSlot(*MBB, MI, available_p_reg, slot, RC, TRI);
        NumLoads++;
      }
      LiveVirtRegs[VirtReg] = { {available_p_reg, MO.getSubReg()}, &MO };

      // Maintain NextUse
      NextUse[VirtReg].pop_front();

      return available_p_reg;
    }


    void allocateInstruction(MachineInstr &MI) {
      // find and allocate all virtual registers in MI
      UsedInInstr = {};

      for (MachineOperand& MO : MI.operands()) {
        if (MO.isReg() && MO.getReg().isPhysical() && MO.getSubReg()) {
          setMachineOperandToPhysReg(MO, TRI->getSubReg(MO.getReg(), MO.getSubReg()));
        }
      }

      // Allocate for all register use
      for (MachineOperand& MO : MI.operands()) {
        if (MO.isReg() && MO.getReg().isVirtual() && MO.isUse()) {
          MCRegister P = allocateOperand(MO, MO.getReg(), true);
          if (MO.getSubReg()) {
            UsedInInstr.insert(TRI->getSubReg(P, MO.getSubReg()));
          } else {
            UsedInInstr.insert(P);
          }
          setMachineOperandToPhysReg(MO, P);
        }
      }

      // Spill all clobbered registers before a call.
      // If the current instruction `I` is a call, one of the
      // arguments will be the special type `RegMask`.
      for (MachineOperand& MO : MI.operands()) {
        if (MO.isRegMask()) {
          const uint32_t* Mask = MO.getRegMask();

          std::vector<Register> v_regs_to_spill;
          v_regs_to_spill.reserve(LiveVirtRegs.size());
          for (auto& kv : LiveVirtRegs) {
            Register v_reg = kv.first;
            auto& p_reg_info = kv.second.first;
            MCRegister prev_alloced_subreg = p_reg_info.first;
            if (p_reg_info.second) {
              prev_alloced_subreg = TRI->getSubReg(prev_alloced_subreg, p_reg_info.second);
            }
            if (MachineOperand::clobbersPhysReg(Mask, prev_alloced_subreg)) {
              v_regs_to_spill.push_back(v_reg);
            }
          }
          // actually spill all the caller-saved regs
          for (Register& v : v_regs_to_spill) {
            spillVirtReg(v, MO.getParent());
          }
        }
      }
      // Allocate for all register def
      for (MachineOperand& MO : MI.operands()) {
        if (MO.isReg() && MO.getReg().isVirtual() && MO.isDef()) {
          MCRegister P = allocateOperand(MO, MO.getReg(), false);
          if (MO.getSubReg()) {
            UsedInInstr.insert(TRI->getSubReg(P, MO.getSubReg()));
          } else {
            UsedInInstr.insert(P);
          }
          setMachineOperandToPhysReg(MO, P);
        }
      }
    }


    void PreAllocationAnalysis(MachineBasicBlock& MBB) {
      // Re-initialize data structures for each basic block's regalloc 
      PreColoredPhysRegs.clear();
      LiveVirtRegs.clear();
      SpillMap.clear();
      UseCount.clear();
      NextUse.clear();
      
      // Setup UseCount - useful for spill candidate decision making
      for (const MachineInstr& MI : MBB) {
        for (const MachineOperand& MO : MI.operands()) {
          if (MO.isReg() && MO.getReg().isVirtual() && MO.isUse()) {
            UseCount[MO.getReg()]++;
          }
        }
      }
      // Setup NextUse - useful for spill candidate decision making
      for (MachineInstr& MI : MBB) {
        for (MachineOperand& MO : MI.operands()) {
          if (MO.isReg() && MO.getReg().isVirtual()) {
            NextUse[MO.getReg()].push_back(&MI);
          }
        }
      }

      // Note all pre-colored physical registers
      for (const MachineInstr& MI : MBB) {
        for (const MachineOperand& MO : MI.operands()) {
          if (MO.isReg() && MO.getReg().isPhysical()) {
            if (MO.getSubReg()) {
              PreColoredPhysRegs.insert(TRI->getSubReg(MO.getReg(), MO.getSubReg()));
            } else {
              PreColoredPhysRegs.insert(MO.getReg());
            }
          }
        }
      }
    }


    void allocateBasicBlock(MachineBasicBlock &MBB) {
      // Run setup and pre-allocation analysis
      PreAllocationAnalysis(MBB);

      // Allocate each instruction
      for (MachineInstr& MI : MBB) {
        allocateInstruction(MI);
      }

      // Spill all live registers at the end if last instruction is NOT a return statement
      if (!MBB.isReturnBlock()) {
        for (auto kv : LiveVirtRegs) {
          Register v_reg_to_spill = kv.first;
          MCRegister p_reg_to_spill = kv.second.first.first;
          if (kv.second.first.second) {
            p_reg_to_spill = TRI->getSubReg(p_reg_to_spill, kv.second.first.second);
          }
          MachineOperand& MO = *kv.second.second;
          const TargetRegisterClass* RC = MRI->getRegClass(v_reg_to_spill);
          // Only spill dirty registers
          bool is_dirty = MO.isDef();
          if (is_dirty && !MO.isKill() && !MO.isDead()) {
            int new_slot = allocateOrFindStackSlot(v_reg_to_spill);
            TII->storeRegToStackSlot(MBB, MBB.getFirstTerminator(), p_reg_to_spill, MO.isKill(), new_slot, RC, TRI);
            NumStores++;
          }
        }
      }

    }

    bool runOnMachineFunction(MachineFunction &MF) override {
      dbgs() << "simple regalloc running on: " << MF.getName() << "\n";

      // outs() << "simple regalloc not implemented\n";
      // abort();

      // Get some useful information about the target
      MRI = &MF.getRegInfo();
      const TargetSubtargetInfo &STI = MF.getSubtarget();
      TRI = STI.getRegisterInfo();
      TII = STI.getInstrInfo();
      MFI = &MF.getFrameInfo();
      MRI->freezeReservedRegs(MF);
      RegClassInfo.runOnMachineFunction(MF);

      // Allocate each basic block locally
      for (MachineBasicBlock &MBB : MF) {
        allocateBasicBlock(MBB);
      }

      MRI->clearVirtRegs();

      // Recompute the analyses that we marked as preserved above, you can
      // safely ignore this code
      SlotIndexes& SI = getAnalysis<SlotIndexes>();
      SI.releaseMemory();
      SI.runOnMachineFunction(MF);

      LiveIntervals& LI = getAnalysis<LiveIntervals>();
      LI.releaseMemory();
      LI.runOnMachineFunction(MF);

      return true;
    }
  };
}

/// Create the initializer and register the pass
char RegAllocSimple::ID = 0;
FunctionPass *llvm::createSimpleRegisterAllocator() { return new RegAllocSimple(); }
INITIALIZE_PASS(RegAllocSimple, "regallocsimple", "Simple Register Allocator", false, false)
static RegisterRegAlloc simpleRegAlloc("simple", "simple register allocator", createSimpleRegisterAllocator);
