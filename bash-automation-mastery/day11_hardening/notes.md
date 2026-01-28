# Day 11 – Unified System Health Check (Final Bash Integration)

## Objective
The goal of Day 11 was to integrate all previously learned Bash scripting concepts
into a single, unified system health monitoring script.

This script improves upon the Day 7 system health check by adding:
- Modular functions
- Command-line options
- Logging
- Safer Bash practices

---

## Features Implemented

### 1. Strict Bash Mode
```bash
set -euo pipefail
```

- Prevents silent failures

- Exits on unset variables

- Fails on pipeline errors

### 2. Logging Mechanism

- Centralized logging using a dedicated log() function

- Logs include timestamp and message

- Log file: /tmp/system_health.log

### 3. Disk Usage Check

- Uses df -h to monitor disk usage

- Compares usage against a defined threshold

- Logs OK or WARNING based on usage percentage

### 4. Memory Usage Check

- Uses free -m to calculate memory usage

- Calculates percentage using arithmetic expansion

- Logs memory usage status

### 5. SSH Failure Detection

- Parses /var/log/auth.log

- Counts failed SSH login attempts

- Handles missing log files safely

### 6. Command-Line Arguments

- getopts used to control which checks run

- Supported options:

 -d → Disk check

 -m → Memory check

 -s → SSH failure check

 This allows selective execution of checks.

### Example Usage
```bash
./system_health.sh -d -m -s

```
Runs all health checks in one execution.

### Key Concepts Practiced

- Functions in Bash

- awk, grep, df, free

- Conditional logic

- Loops with read

- Command-line option parsing (getopts)

- Logging and timestamps

- Defensive scripting

### Outcome

By the end of Day 11, the script resembles a real-world
Linux system monitoring utility and serves as a strong
foundation for further automation and DevOps tooling.
