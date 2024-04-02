# Maintenance Script for Hive OS

## Overview

This script is specifically designed for automating the maintenance process of mining systems running Hive OS. It executes a series of commands to manage the mining software and system resources efficiently. The script stops the mining process, cleans up installed versions of the mining software, updates Nvidia drivers to the latest version available, removes old Nvidia driver packages, reinstalls nvidia-settings, checks disk space, and finally, prompts for a system restart. It includes error handling to provide warnings for specific known issues and errors for unexpected conditions.

## Installation

To install this maintenance script on your Hive OS setup, use the `curl` command to download it from GitHub releases and make it executable. Replace `URL_TO_SCRIPT` with the actual URL to the script in your GitHub repository's releases.

```bash
curl -LJO https://github.com/fortunacio/hiveos-maintenance-tool/archive/refs/tags/v0.1.0.zip
unzip hiveos-maintenance-tool-0.1.0.zip
cd hiveos-maintenance-tool-0.1.0.zip
chmod +x hiveos_maintenance.sh
```

## Usage

Once the script is installed, you can run it directly from the terminal of your Hive OS system. It does not require any arguments and will proceed through the maintenance steps automatically, providing step-by-step feedback in the terminal.

```bash
./hiveos_maintenance.sh
```

### Script Functions

1. **Stops the mining process:** Ensures the miner is safely stopped before proceeding with maintenance tasks.
2. **Cleans up installed miner versions:** Removes all previously installed versions of the mining software.
3. **Updates Nvidia drivers:** Checks and updates the Nvidia drivers to the latest version available.
4. **Removes old Nvidia drivers:** Cleans up old Nvidia driver packages that are no longer needed.
5. **Reinstalls nvidia-settings:** Makes sure that nvidia-settings is correctly installed and configured.
6. **Checks disk space:** Provides a summary of the available disk space on the system.
7. **System restart:** Prompts the user to restart the system to ensure all updates and changes are applied effectively.

### Important Notes

- Run the script with root privileges to ensure it can execute all commands without permission issues.
- It's recommended to review and test the script in a controlled environment before running it on your production Hive OS systems to avoid any unintended consequences.