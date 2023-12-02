set -e
#!/bin/bash
# Cleanup files from last time
rm z_*.txt

# Change to the 'test' subdirectory
cd "$(dirname "$0")/test" || exit 1





# Find all _ref.out files and process them
for ref_file in *.refout; do
    if [ -f "$ref_file" ]; then
        testname="${ref_file%.refout}"
        out_file="${testname}.out"
        
        if [ -f "$out_file" ]; then
            echo "Comparing $out_file and $ref_file" >> ../z_diffs.txt
            diff "$out_file" "$ref_file" >> ../z_diffs.txt || continue

            # printout the stdout of my generated binary
            echo "$out_file:" >> ../z_my_result.txt 
            cat "$out_file" >> ../z_my_result.txt 
            # printout the stdout of reference binary
            echo "$ref_file:" >> ../z_ref_result.txt 
            cat "$ref_file" >> ../z_ref_result.txt 


            echo  >> ../z_diffs.txt

        fi
    fi
done
