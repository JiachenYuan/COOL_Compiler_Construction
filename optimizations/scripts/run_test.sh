cd build
cmake ..
make -j
cd ..
cd $2

echo "Running complicated test: $1" >&2
clang-15 $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt-15  -load-pass-plugin=../build/libUnitProject.so -passes="function(mem2reg,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,unit-licm,adce,simplifycfg,instcombine),globaldce" -S -o ${1%.*}.ll

echo "----------------------------------------" >&2
echo "Running sccp only: $1" >&2
clang-15 $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt-15  -load-pass-plugin=../build/libUnitProject.so -passes="mem2reg,unit-sccp" -S -o ${1%.*}.ll

echo "----------------------------------------" >&2
echo "Running licm only: $1" >&2
clang-15 $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt-15  -load-pass-plugin=../build/libUnitProject.so -passes="mem2reg,unit-licm" -S -o ${1%.*}.ll

echo "----------------------------------------" >&2
echo "Running sccp and licm: $1" >&2
clang-15 $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt-15  -load-pass-plugin=../build/libUnitProject.so -passes="unit-licm,unit-sccp" -S -o ${1%.*}.ll

