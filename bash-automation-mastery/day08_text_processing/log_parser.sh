#!/bin/bash

# Author: Shaheen
# Purpose: Parse authentication logs
# Day 8: Advanced Bash Text Processing

set -euo pipefail

LOG_FILE="/var/log/auth.log"

# 1. Count Failed SSH attempts

echo "Failed SSH attempts:"
grep "Failed password" "$LOG_FILE" | wc -l

echo

# 2. Show last 5 failed attempts(time+user)

echo " Last 5 failed SSH attempts:"

grep "Failed password" "$LOG_FILE" | tail -5
