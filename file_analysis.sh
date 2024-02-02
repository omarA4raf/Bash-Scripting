#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

directory_path=$1

# Function to analyze file using various tools
analyze_file() {
    file=$1
    echo "Analyzing file: $file"

    # Using ExifTool
    exiftool $file

    # Using MediaInfo
    mediainfo $file

    # Using Tcpdump (for pcap files)
    if [ "$(file -b --mime-type $file)" == "application/vnd.tcpdump.pcap" ]; then
        tcpdump -tttt -r $file
    fi

    # Using Strings
    strings $file
}

# Iterate through files in the specified directory
for file in $directory_path/*; do
    analyze_file $file
done
