#!/bin/bash

# this script use function to avoid repeating code for logs

LOG_FILE="/tmp/function.log"

log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}

log "Script started"
log "Processing data"
log "script finished"
