#!/bin/bash

# Set the directory you want to work with
directory="."

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# List and sort files by names in the directory
sorted_files=($(find "$directory" -type f -print | sort))

# Create or truncate the temp.txt file
temp_file="./auto_diffs_result.txt"
> "$temp_file"

# Loop through the sorted files, comparing them in pairs
for ((i = 0; i < ${#sorted_files[@]} - 1; i += 2)); do
  file1="${sorted_files[i]}"
  file2="${sorted_files[i+1]}"
  echo "Comparing files: $file1 and $file2" >> "$temp_file"
  diff "$file1" "$file2" >> "$temp_file"
  echo "" >> "$temp_file"
done

echo "Comparison results saved in $temp_file"
