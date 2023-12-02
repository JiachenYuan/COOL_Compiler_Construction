#!/bin/bash

# Set the path to the directory containing the LLVM IR files
input_directory="mp4_testcases"

# Set the path to the output file
output_file="my_result.txt"

echo "" >$output_file

# Iterate over all *.ll files in the directory
for file in "$input_directory"/*.ll; do
    # Check if there are matching files
    if [ -e "$file" ]; then
        # # Extract the file name without extension
        # filename=$(basename -- "$file")
        # filename_noext="${filename%.*}"

        # Run the llc command and append the result to the output file
        llc -regalloc=simple -stats "$file" >> "$output_file" 2>&1
        echo "$file is finished" >> "$output_file"

        # Optionally, you can add more commands or processing here
        # For example, you might want to move or rename the output files
        # based on the original file name.
    fi
done

sed '/^>>>/d; /^$/d' $output_file > "my_result_filtered"

