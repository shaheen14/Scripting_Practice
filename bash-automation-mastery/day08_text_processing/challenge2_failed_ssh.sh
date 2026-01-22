#!/bin/bash

# Author: Shaheen
# Purpose: Count failed SSH login attempts
# Day 8: Advanced Bash Text Processing challenge

set -euo pipefail

grep "Failed password" /var/log/auth.log | wc -l

