#ifndef INCLUDE_UNIT_SCCP_H
#define INCLUDE_UNIT_SCCP_H
#include "llvm/IR/PassManager.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Instructions.h"

using namespace llvm;

namespace cs426 {
/// Sparse Conditional Constant Propagation Optimization Pass
struct UnitSCCP : PassInfoMixin<UnitSCCP> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
  void Initialize(Function& F);
  void VisitInstr(Instruction* I);
  void AddEdge(BasicBlock* BB, BranchInst* BR, int idx);
  std::pair<int, Constant*> GetLat(Value* V);
  bool Meet(Instruction *I, std::pair<int, Constant*> Lat2);
  DenseSet<std::pair<BasicBlock *, BasicBlock *>> ExecFlag;
  DenseMap<Value *, std::pair<int, Constant*> > LatCell; // -1: bottom, 0: constant, 1: top
  SmallVector<BasicBlock *> FlowSourceWL;
  DenseSet<BasicBlock *> VisitedFlowSource;
  SmallVector<Value *> SSASourceWL;
  DenseSet<Value *> VisitedSSASource;
};
} // namespace

#endif // INCLUDE_UNIT_SCCP_H
