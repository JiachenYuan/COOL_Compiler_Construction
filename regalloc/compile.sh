cd ~/llvm15/
cp -rf ../mp4_handout/RegAllocSimple.cpp llvm/lib/CodeGen
cd build
# cmake \
#  -DCMAKE_C_COMPILER="clang-15" -DCMAKE_CXX_COMPILER="clang++-15" -DLLVM_USE_LINKER=lld \
#  -DCMAKE_BUILD_TYPE="Debug" -DLLVM_TARGETS_TO_BUILD="X86" -DLLVM_INCLUDE_BENCHMARKS=Off ../llvm
make -j4 llc
