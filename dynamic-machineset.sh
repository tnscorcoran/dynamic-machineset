#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <input_file> (instanceType e.g. g5.12xlarge) <replacement1> <replacement2> <replacement3>/n"
    exit 1
}

# Check if correct number of arguments provided
if [ "$#" -ne 5 ]; then
    usage
fi

input_file=$1
instanceType=$2
replacement1=$3
replacement2=$4
replacement3=$5

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file $input_file does not exist."
    exit 1
fi

# Perform the replacement
sed -i "s/$placeholder/$replacement1/g; s/$placeholder/$replacement2/g; s/$placeholder/$replacement3/g" "$input_file"

echo "Replacement complete. Check $input_file for the updated content."
