#!/bin/bash

# Author: Shaheen
# Purpose: Show Top 5 Memory Consuming Processes
# Day 8: Advanced Bash Text Processing Challenge 3

set -euo pipefail

ps aux | sort -nrk 4 | head -5
