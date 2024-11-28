#!/bin/bash

input=$1
output=$2

if [[ $# -ne 2 ]]; then
	echo "error: $0 <input><output>"
	exit 1
fi

if [[ ! -e "$input" ]]; then
	echo "file does not exist."
	exit 1
fi

if [[ ! -s "$input" ]]; then
        echo "file is empty."
        exit 1
fi

./validate-missing-fields.sh "$input" "$output"
./invalid-age-fields.sh "$input" "$output"
./invalid-email-fields.sh "$input" "$output"
