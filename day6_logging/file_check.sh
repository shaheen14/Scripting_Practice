#!/bin/bash

# this script checks file provided in argument with logging

LOG_FILE="/tmp/file_check.log"

FILE=$1

log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}


# check if argument is provided

if [ -z "$FILE" ]; then
	log "ERROR: No file provided"
	echo "Usage: $0 <filename>"
	exit 1
fi

# check if file exists

if [ -f "$FILE" ]; then
	log "File exists: $FILE"
else
        log "File not Found: $FILE"
fi	



