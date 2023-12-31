cd build
cmake ..
make -j
cd ..
cd tests
# clang $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt -print-after-all -verify-each -load-pass-plugin=../build/libUnitProject.so -passes="function(mem2reg,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,unit-licm,adce,simplifycfg,instcombine),globaldce" -S -o ${1%.*}.ll
clang $1 -c -O0 -Xclang -disable-O0-optnone -emit-llvm -S -o - | opt  -verify-each -load-pass-plugin=../build/libUnitProject.so -passes="mem2reg,unit-licm" -S -o ${1%.*}.ll