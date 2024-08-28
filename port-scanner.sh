#!/bin/bash

# Function to display the welcome message with animation
welcome_message() {
    msg="Satvik [ An0n B@sH ]"
    echo -e "\e[31;1m" # Red color, bold text
    for (( i=0; i<${#msg}; i++ )); do
        echo -n "${msg:$i:1}"
        sleep 0.1
    done
    echo -e "\e[0m" # Reset color
}

# Function to display the help guide
show_help() {
    echo -e "\e[32;1mUsage: $0 [OPTIONS]\e[0m"
    echo -e "\e[34;1mOptions:\e[0m"
    echo -e "  \e[34;1m<IP/Domain>\e[0m       Specify the IP address or domain name to scan."
    echo -e "  \e[34;1m-h, --help\e[0m       Show this help message."
    echo -e "\n\e[32;1mAuthor: Satvik (An0n B@sH)\e[0m"
    echo -e "\e[32;1mLinks: https://satvik.live\e[0m"
}

# Function to resolve hostname or IP address
resolve_target() {
    if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        # It's an IP address
        hostname=$(nslookup $1 | grep 'name =' | awk '{print $4}')
        if [ -z "$hostname" ]; then
            echo -e "\e[34;1mResolved Hostname: $1\e[0m"
        else
            echo -e "\e[34;1mResolved Hostname: $hostname\e[0m"
        fi
    else
        # It's a domain name
        ip=$(nslookup $1 | grep 'Address: ' | tail -n 1 | awk '{print $2}')
        echo -e "\e[34;1mResolved IP: $ip\e[0m"
    fi
}

# Function to show live estimated time during scan
show_estimated_time() {
    end_time=$((SECONDS + $1))
    while [ $SECONDS -lt $end_time ]; do
        remaining=$((end_time - SECONDS))
        mins=$((remaining / 60))
        secs=$((remaining % 60))
        printf "\r\e[33;1mEstimated Completion Time: %02d:%02d\e[0m" $mins $secs
        sleep 1
    done
    echo -e "\n"
}

# Main script starts here
welcome_message

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

if [ -z "$1" ]; then
    read -p "Enter IP address or Domain name: " TARGET
else
    TARGET=$1
fi

resolve_target $TARGET

# Wait for 3 seconds with initializing message
echo -e "\e[32;1mInitializing Scan ....\e[0m"
sleep 3

echo -e "\e[32;1mStarting Port Scan on $TARGET...\e[0m"

# Estimated time for scan completion
# This is a dummy estimate for demonstration; adjust as needed
estimated_time=60  # in seconds

# Show live estimated time
show_estimated_time $estimated_time &

# Step 2: Perform Nmap Scan with verbose output
nmap -sS -p- -v $TARGET

# Kill the timer after scan completes
kill $! 2>/dev/null

# Step 3: Check for Vulnerabilities with Nikto
echo -e "\e[32;1mRunning Nikto scan on $TARGET...\e[0m"
nikto -h $TARGET

echo -e "\e[32;1mScanning Completed.\e[0m"
