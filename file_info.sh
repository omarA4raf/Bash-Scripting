#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path=$1

# Display file information
echo "File Information for $file_path:"
echo "Size: $(du -h $file_path | cut -f1)"
echo "Type: $(file -b $file_path)"
echo "Permissions: $(ls -l $file_path | cut -d" " -f1)"
