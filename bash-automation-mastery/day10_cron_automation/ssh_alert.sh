#!/bin/bash

# Author: Shaheen
# Purpose: Alert on excessive ssh failed attempts
# Day 9: Log-based Alerting

set -euo pipefail

LOG_FILE="/var/log/auth.log"
THRESHOLD=5

FAILED_COUNT=$(/bin/grep "Failed password" "$LOG_FILE" | /usr/bin/wc -l)

if [ "$FAILED_COUNT" -gt "$THRESHOLD" ]; then
	echo "ALERT: $FAILED_COUNT Failed SSH login attempts detected"
else
        echo "OK: SSH failures within limit ($FAILED_COUNT)"
fi	
