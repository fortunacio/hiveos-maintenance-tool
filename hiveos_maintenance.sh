#!/bin/bash

# Function to print a step message and execute a command
print_step() {
    echo -e "\e[32mSTEP $1: $2 ($3)\e[0m"
}

# Function to print a warning message
print_warning() {
    echo -e "\e[33mWarning: executing command: $1\e[0m"
}

# Function to print an error message
print_error() {
    echo -e "\e[91mError: executing command: $1\e[0m"
}

run_command() {
    print_step "$1" "$2" "$3"

    output=$($3 2>&1)
    exit_status=$? 

    if [ $exit_status -eq 0 ]; then
        echo "$output"
    else
        if [ $1 -eq 1 ]; then
            if [[ "$output" != *"no miner screen found"* ]]; then
                print_warning "$2"
            fi
        elif [ $1 -eq 3 ]; then
            if [[ "$output" != *"this version is already installed"* ]]; then
                print_warning "$2"
            fi
        else
            print_error "$2"
            echo "$output"
        fi
    fi
}


# Execute commands one by one
run_command 1 "Waiting for the miner to stop" "miner stop"
run_command 2 "Cleaning all installed miner versions" "hpkg purge"
run_command 3 "Updating Nvidia drivers to the latest version, if available" "nvidia-driver-update"
run_command 4 "Removing all old Nvidia driver installation packages" "nvidia-driver-update --remove"
run_command 6 "Reinstall nvidia-settings only" "nvidia-driver-update --nvs"
run_command 7 "Checking disk space..." "df -h"


# If all commands executed successfully, prompt the user to press a key to restart
echo "All commands executed successfully. Press any key to restart."
read -n 1 -s -r -p "Press any key to continue"
echo ""

# Restarting the system
reboot

