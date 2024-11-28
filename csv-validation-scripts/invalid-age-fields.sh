#!/bin/bash

filename=$1
saveto=$2

# Ensure two arguments are provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <input-file> <output-file>"
    exit 1
fi

# Check if the input file exists and is not empty
if [[ ! -e $filename || ! -s $filename ]]; then
    echo "Error: The input file does not exist or is empty."
    exit 1
fi

# Add header to the output file if it's empty or doesn't exist
if [[ ! -s $saveto ]]; then
    echo "Name,Age,Email" > "$saveto"
fi

# Detect if the input file has a header
input_has_header=$(head -n 1 "$filename" | grep -E 'Name,Age,Email')

if [[ -n $input_has_header ]]; then
    # Skip header and process remaining rows
    tail -n +2 "$filename" | grep -vE ',[1-9][0-9],[^,]*$' >> "$saveto"
else
    # Process all rows if no header is detected
    grep -vE ',[1-9][0-9],[^,]*$' "$filename" >> "$saveto"
fi

# Deduplicate and sort the file while preserving the header
temp_file=$(mktemp)
head -n 1 "$saveto" > "$temp_file"                  # Copy header
tail -n +2 "$saveto" | sort | uniq >> "$temp_file"  # Sort and deduplicate rows
mv "$temp_file" "$saveto"                          # Replace with cleaned file

echo "Invalid age fields are now saved to $saveto."

