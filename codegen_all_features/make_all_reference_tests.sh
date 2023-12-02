set -e
cd test/

for file in *.cl; do
    name="${file%.cl}"
    ../reference-binaries/lexer "${name}.cl" | ../reference-binaries/parser | ../reference-binaries/semant | ../reference-binaries/cgen-1 > "${name}_ref.ll"

    clang-15 -g "${name}_ref.ll"  -o "${name}_ref_executable.out" 
    echo ${name}
    ./${name}_ref_executable.out > "${name}_ref.out" 2>&1 
    rm ./${name}_ref_executable.out
done