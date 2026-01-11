#!/bin/bash

# this script checks the log file size if size is greater than 1 MB it clears the log file and logs the cleanup action
# this prevent log file from growing endlessly

LOG_FILE="/tmp/script.log"
MAX_SIZE=1048576 # 1MB

log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}

# checks if log file exists
if [ -f "$LOG_FILE" ]; then
	SIZE=$(stat -c %s "$LOG_FILE")
	if [ "$SIZE" -gt "$MAX_SIZE" ]; then
		echo "" > "$LOG_FILE" # clear the log file
		log "Log file exceeded size limit 1 MB and was cleared" # logging
	fi
else
     echo "Log file doesn't exist.Creating it"
     touch "$LOG_FILE"
fi     
