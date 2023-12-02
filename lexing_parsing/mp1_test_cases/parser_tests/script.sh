#!/bin/bash

# Set the directory you want to work with
directory="."
odir="../parse_tests_result"

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "Directory not found: $directory"
  exit 1
fi

# Loop through each file in the directory
for file in "$directory"/*; do
  # Check if the item is a file (not a directory)
  if [ -f "$file" ]; then
    echo "File: $file"
    # Perform your task on the file here
    # For example, you can add more commands to process the file
    ../../src/lexer $file | ../../src/parser > "$odir"/"$file"_mine.txt 2>&1
    ../../reference-binaries/lexer $file | ../../reference-binaries/parser > "$odir"/"$file"_reference.txt 2>&1
  fi
done
