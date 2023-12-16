// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-sccp"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/IR/Constants.h"

#include "UnitSCCP.h"

#define DEBUG_TYPE "UnitSCCP"

using namespace llvm;
using namespace cs426;

// Define any statistics here
STATISTIC(UnitSCCPRemove, "Number of instructions removed");
STATISTIC(UnitSCCPUnreachable, "Number of basic blocks unreachable");
STATISTIC(UnitSCCPSimplified, "Number of instructions simplified");

/// Main function for running the SCCP optimization
PreservedAnalyses UnitSCCP::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitSCCP running on " << F.getName() << "\n";

  this->Initialize(F);
  while (!this->FlowSourceWL.empty() || !this->SSASourceWL.empty()) {
    if (!this->FlowSourceWL.empty()) {
      BasicBlock* BB = this->FlowSourceWL.pop_back_val();
      dbgs() << "Visiting BB: " << BB->getName() << "\n";
      for (Instruction& I : *BB) this->VisitInstr(&I);
      this->VisitedFlowSource.insert(BB);
    } else if (!this->SSASourceWL.empty()) {
      Value* V = this->SSASourceWL.pop_back_val();
      this->VisitedSSASource.erase(V);
      if (Instruction* I = dyn_cast<Instruction>(V)) {
        dbgs() << "Visiting SSA: " << *I << "\n";
        this->VisitInstr(I);
      }
    }
  }

  for (auto v: this->LatCell) {
    if (Instruction* I = dyn_cast<Instruction>(v.first)) {
      if (v.second.first == 0) {
        dbgs() << "Removing: " << *I << ", replacing with: " << *v.second.second << "\n";
        BasicBlock::iterator iterator(I);
        UnitSCCPRemove++;
        UnitSCCPSimplified += I->getNumUses();
        ReplaceInstWithValue(I->getParent()->getInstList(), iterator, v.second.second);
      }
    }
  }

  DenseSet<BasicBlock*> VisitedSecondTime;
  this->FlowSourceWL.insert(this->FlowSourceWL.begin(), &F.getEntryBlock());
  while (!this->FlowSourceWL.empty()) {
    BasicBlock* BB = this->FlowSourceWL.pop_back_val();
    VisitedSecondTime.insert(BB);
    if (this->VisitedFlowSource.count(BB) == 0) {
      dbgs() << "Unreachable: " << BB->getName() << "\n";
      UnitSCCPUnreachable++;
    }
    for (BasicBlock* Succ : successors(BB)) if (VisitedSecondTime.count(Succ) == 0) this->FlowSourceWL.insert(this->FlowSourceWL.begin(), Succ);
  }

  dbgs() << "UnitSCCP: " << UnitSCCPRemove << " instructions removed, " << UnitSCCPUnreachable << " basic blocks unreachable, " << UnitSCCPSimplified << " instructions simplified\n";
  return PreservedAnalyses::all();
}


void UnitSCCP::Initialize(Function& F) {
  this->ExecFlag.clear();
  this->LatCell.clear();
  this->VisitedFlowSource.clear();
  this->FlowSourceWL.insert(this->FlowSourceWL.begin(), &F.getEntryBlock());
  for (Argument& arg : F.args()) this->LatCell[&arg] = std::make_pair(-1, nullptr);
}


void UnitSCCP::VisitInstr(Instruction* I) {
  dbgs() << "VisitInstr: " << *I << "\n";
  if (BranchInst *BR = dyn_cast<BranchInst>(I)) {
    dbgs() << "BranchInst: " << *BR << "\n";
    if (BR->isConditional()) {
      std::pair<int, Constant*> LatCond = this->GetLat(BR->getCondition());
      dbgs() << "In BranchInst: " << LatCond.first << ", " << LatCond.second << "\n";
      if (LatCond.first == -1) {
        this->AddEdge(BR->getParent(), BR, 0);
        this->AddEdge(BR->getParent(), BR, 1);
      } else if (LatCond.second->isNullValue()) this->AddEdge(BR->getParent(), BR, 1);
        else if (LatCond.second->isOneValue()) this->AddEdge(BR->getParent(), BR, 0);
    } else this->AddEdge(BR->getParent(), BR, 0);
  } else if (this->LatCell.count(I) == 0 || this->LatCell[I].first != -1) {
    std::pair<int, Constant*> EvaluatedLatCell = std::make_pair(-1, nullptr);
    if (I->isUnaryOp() || I->isCast()) {
      dbgs() << "UnaryOp: " << *I << "\n";
      std::pair<int, Constant*> LatOp = this->GetLat(I->getOperand(0));
      if (LatOp.first == 0) EvaluatedLatCell = std::make_pair(0, ConstantExpr::get(I->getOpcode(), LatOp.second));
    } else if (I->isBinaryOp()) {
      dbgs() << "BinaryOp: " << *I << "\n";
      std::pair<int, Constant*> LatOp1 = this->GetLat(I->getOperand(0));
      std::pair<int, Constant*> LatOp2 = this->GetLat(I->getOperand(1));
      if (LatOp1.first == 0 && LatOp2.first == 0) EvaluatedLatCell = std::make_pair(0, ConstantExpr::get(I->getOpcode(), LatOp1.second, LatOp2.second));
    } else if (I->getOpcode() == Instruction::ICmp || I->getOpcode() == Instruction::FCmp) {
      CmpInst* CI = dyn_cast<CmpInst>(I);
      dbgs() << "CmpInst: " << *I << "\n";
      std::pair<int, Constant*> LatOp1 = this->GetLat(I->getOperand(0));
      std::pair<int, Constant*> LatOp2 = this->GetLat(I->getOperand(1));
      if (LatOp1.first == 0 && LatOp2.first == 0) EvaluatedLatCell = std::make_pair(0, ConstantExpr::getCompare(CI->getPredicate(), LatOp1.second, LatOp2.second));
    }else if (I->getOpcode() == Instruction::PHI) {
      dbgs() << "PHI: " << *I << "\n";
      PHINode* PN = dyn_cast<PHINode>(I);
      std::pair<int, Constant*> LatCell_ = std::make_pair(1, nullptr);
      for (unsigned i = 0; i < PN->getNumOperands(); i++) {
        Value* IncomingValue = PN->getIncomingValue(i);
        BasicBlock* IncomingBlock = PN->getIncomingBlock(i);
        if (this->ExecFlag.count(std::make_pair(IncomingBlock, I->getParent()))) {
          std::pair<int, Constant*> LatOp = this->GetLat(IncomingValue);
          dbgs() << "PHI LatOp: " << LatOp.first << ", " << LatOp.second << "\n";
          if (LatOp.first == -1) {
            LatCell_ = std::make_pair(-1, nullptr);
            break;
          } else if (LatCell_.first == 1) LatCell_ = LatOp;
          else if (LatOp.first != 1 && !LatCell_.second->isElementWiseEqual(LatOp.second)) {
            LatCell_ = std::make_pair(-1, nullptr);
            break;
          }
        }
      }
      EvaluatedLatCell = LatCell_;
    } else if (I->getOpcode() == Instruction::Select) {
      dbgs() << "Select: " << *I << "\n";
      SelectInst* SI = dyn_cast<SelectInst>(I);
      std::pair<int, Constant*> LatCond = this->GetLat(SI->getCondition());
      std::pair<int, Constant*> LatTrue = this->GetLat(SI->getTrueValue());
      std::pair<int, Constant*> LatFals = this->GetLat(SI->getFalseValue());
      dbgs() << "Select LatCond: " << LatCond.first << ", " << LatCond.second << "\n";
      dbgs() << "Select LatTrue: " << LatTrue.first << ", " << LatTrue.second << "\n";
      dbgs() << "Select LatFals: " << LatFals.first << ", " << LatFals.second << "\n";
      if (LatCond.first == -1) {
        if (LatTrue.first == 1 || (LatTrue.second != nullptr && LatFals.second != nullptr && LatTrue.second->isElementWiseEqual(LatFals.second))) EvaluatedLatCell = LatFals;
        else if (LatFals.first == 1) EvaluatedLatCell = LatTrue;
      } else {
        if (LatCond.second->isNullValue()) EvaluatedLatCell = LatFals;
        else EvaluatedLatCell = LatTrue;
      }
    } else if (I->getOpcode() == Instruction::GetElementPtr) {
      dbgs() << "GetElementPtr: " << *I << "\n";
      GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(I);
      std::pair<int, Constant*> LatOp = this->GetLat(GEP->getPointerOperand());
      if (LatOp.first > -1) {
        if (GEP->hasAllConstantIndices()) {
          SmallVector<Value*, 8> Indices;
          for (auto Idx = GEP->idx_begin(); Idx != GEP->idx_end(); Idx++) Indices.push_back(*Idx);
          EvaluatedLatCell = std::make_pair(0, ConstantExpr::getGetElementPtr(GEP->getSourceElementType(), LatOp.second, Indices));
        }
      }
    }
    dbgs() << "Check LatCell: " << this->LatCell.count(I) << "\n";
    if (this->Meet(I, EvaluatedLatCell)) {
      dbgs() << "Meet: " << *I << "\n";
      for (User* U : I->users()) {
        if (Instruction* UI = dyn_cast<Instruction>(U)) {
          if (this->VisitedFlowSource.count(UI->getParent()) && !this->VisitedSSASource.count(UI)) {
            dbgs() << "Adding SSA: " << *UI << "\n";
            this->SSASourceWL.insert(this->SSASourceWL.begin(), UI);
            this->VisitedSSASource.insert(UI);
          }
        }
      }
    }
  }
}


std::pair<int, Constant*> UnitSCCP::GetLat(Value* V) {
  if (Constant* C = dyn_cast<Constant>(V)) return std::make_pair(0, C);
  else {
    assert (this->LatCell.count(V) != 0);
    return this->LatCell[V];
  }
}


bool UnitSCCP::Meet(Instruction *I, std::pair<int, Constant*> Lat2) {
  std::pair<int, Constant*> Lat1;
  if (this->LatCell.count(I) == 0) Lat1 = std::make_pair(1, nullptr);
  else Lat1 = this->LatCell[I];
  dbgs() << "In Meet: " << *I << ", Lat1: (" << Lat1.first << ", " << Lat1.second << "), Lat2: (" << Lat2.first << ", " << Lat2.second << ")" <<  "\n";
  if (Lat1.second != nullptr) dbgs() << "Lat1.second: " << *Lat1.second << "\n";
  if (Lat2.second != nullptr) dbgs() << "Lat2.second: " << *Lat2.second << "\n";
  assert (Lat1.first != 1 || Lat2.first != 1);
  if (Lat1.first == -1 || Lat2.first == -1) {
    this->LatCell[I] = std::make_pair(-1, nullptr);
    return true;
  } else if (Lat1.first == 1) {
    this->LatCell[I] = Lat2;
    return true;
  } else if (Lat2.first == 1 || Lat1.second->isElementWiseEqual(Lat2.second)) return false;
  else {
    this->LatCell[I] = std::make_pair(-1, nullptr);
    return true;
  }
}


void UnitSCCP::AddEdge(BasicBlock* BB, BranchInst* BR, int idx) {
  dbgs() << "In AddEdge: " << BB << ", " << BR << ", " << idx << "\n";
  BasicBlock* Succ = BR->getSuccessor(idx);
  if (this->ExecFlag.count(std::make_pair(BB, Succ)) == 0) {
    dbgs() << "Adding edge: " << BB->getName() << " -> " << Succ->getName() << "\n";
    this->ExecFlag.insert(std::make_pair(BB, Succ));
    if (this->VisitedFlowSource.count(Succ) == 0) this->FlowSourceWL.insert(this->FlowSourceWL.begin(), Succ);
  }
}
