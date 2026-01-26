#!/bin/bash 

# Author: Shaheen
# Purpose: Alert on high memory usage
# Day 9: Resource Alerting

set -euo pipefail
THRESHOLD=80

read used total <<< $(free -m | awk '/Mem:/ {print $3,$2}')
PERCENT=$(( used * 100 / total ))

if [ "$PERCENT" -gt "$THRESHOLD" ]; then
    echo "ALERT: Memory usage is ${PERCENT}%"
else
    echo "OK: Memory usage is ${PERCENT}%"
fi
