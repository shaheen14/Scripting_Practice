#!/bin/bash


# Author: Shaheen
# Purpose: Extracts only the username from /etc/passwd
# Day 8: Advanced Bash Text processing

set -euo pipefail

awk -F: '{print $1}' /etc/passwd
