set -e
cd test/

for file in *.cl; do
    name="${file%.cl}"  # Extract the name without the ".cl" suffix
    make "$name.out"
done
