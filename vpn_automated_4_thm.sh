#!/bin/bash

# Function to check and print status
check_status() {
    echo "Status: $1"
}

# Connect using warp
warp connect
check_status "Connected using Warp"

# Check if an IP has been assigned
warp_ip=$(curl ifconfig.me)
check_status "Warp IP: $warp_ip"

# Connect using openVPN (in the background)
openvpn --config /path/to/openvpn/config.ovpn &
check_status "Connecting using OpenVPN (background)"

# Wait for connection and check IP
sleep 5
openvpn_ip=$(curl ifconfig.me)
check_status "OpenVPN IP: $openvpn_ip"

# Second check - ping
ping_result=$(ping -c 3 10.10.10.10)
check_status "Ping Result: $ping_result"

# Disconnect from warp
warp disconnect
check_status "Disconnected from Warp"
