#!/bin/bash

# Default values
length=12
include_upper=false
include_lower=false
include_numbers=false
include_special=false

# Function to display usage information
usage() {
    echo "Usage: $0 [-l length] [-u] [-d] [-n] [-s]"
    echo "Options:"
    echo "  -l: Length of the password (default: 12)"
    echo "  -u: Include uppercase letters"
    echo "  -d: Include lowercase letters"
    echo "  -n: Include numbers"
    echo "  -s: Include special characters"
    exit 1
}

# Parse command line options
while getopts "l:udns" opt; do
    case $opt in
        l) length=$OPTARG ;;
        u) include_upper=true ;;
        d) include_lower=true ;;
        n) include_numbers=true ;;
        s) include_special=true ;;
        *) usage ;;
    esac
done

# Generate random password based on specified criteria
password=$(openssl rand -base64 48 | tr -dc 'a-zA-Z0-9!@#$%^&*()_+-=[]{}|;:,.<>?')
echo "Generated Password: $password"
