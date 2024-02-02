#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain_list_file> <iterations>"
    exit 1
fi

domain_list_file=$1
iterations=$2

# Function to perform subdomain enumeration
enumerate_subdomains() {
    domain_file=$1
    result_file=$2
    amass enum -d $(cat $domain_file) -o $result_file
}

# Perform subdomain enumeration for the specified number of iterations
for ((i=1; i<=$iterations; i++)); do
    result_file="subdomains_iteration_$i.txt"
    enumerate_subdomains $domain_list_file $result_file
    domain_list_file=$result_file
done

# Save unique results to a file and count them
final_result_file="unique_subdomains.txt"
cat $result_file | sort -u > $final_result_file
subdomain_count=$(wc -l $final_result_file | cut -d" " -f1)

echo "Unique Subdomains Count: $subdomain_count"
