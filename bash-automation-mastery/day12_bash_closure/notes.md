# Day 12 — System Health Monitoring Script (Production Level)

## Objective
Create a production-ready Bash script that monitors system health based on user-selected checks and configurable thresholds.

This script is designed to be flexible, safe, and suitable for real Linux servers.

---

## Script Features Implemented

- Disk usage monitoring
- Memory usage monitoring
- Failed SSH login attempt monitoring
- User-selected checks using command-line options
- Individual thresholds for each check
- Centralized logging with timestamps
- Safe Bash practices (`set -euo pipefail`)

---

## Default Behavior

If thresholds are not provided by the user, the script uses these defaults:

- Disk threshold: 60%
- Memory threshold: 70%
- SSH failure threshold: 5 attempts
- Log file: `/tmp/sys_monitor.log`

At least one check (`-d`, `-m`, or `-s`) must be selected, otherwise the script exits.

---

## Command-Line Options

```bash
-d   Enable disk usage check
-m   Enable memory usage check
-s   Enable SSH failure check

-D   Set disk usage threshold (percentage)
-M   Set memory usage threshold (percentage)
-S   Set SSH failure threshold (count)
```
---
## Argument Parsing

The script uses getopts to parse arguments:

while getopts "dmsD:M:S:" opt; do


Each option updates internal flags or threshold variables.
---

## Logging

All output is logged with timestamps using a common logging function:

log() {
  echo "$(date '+%F %T') - $1" | tee -a "$LOGFILE"
}


Logs are written to:

/tmp/sys_monitor.log

---
## Disk Usage Check

- Uses df -P to get disk usage

- Extracts usage percentage

- Compares against DISK_THRESHOLD

- Logs OK or WARNING per filesystem
---
## Memory Usage Check

- Uses free -m

- Calculates memory usage percentage

- Compares against MEM_THRESHOLD

- Logs normal or alert status
---
## SSH Failure Check

- Uses journalctl for ssh and sshd

- Filters failed login attempts from the last 1 hour

- Compares count against SSH_THRESHOLD

- Logs alert or normal status
---
## Conditional Execution

  Checks are executed only if explicitly enabled:

- $CHECK_DISK && check_disk
- $CHECK_MEM && check_mem
- $CHECK_SSH && check_ssh
---
## Example Usage
- ./system_health_user_input.sh -d
- ./system_health_user_input.sh -m -M 80
- ./system_health_user_input.sh -d -m -s
- ./system_health_user_input.sh -s -S 10
---
