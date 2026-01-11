#!/bin/bash

# This script monitors disk with given threshold with logging

LOG_FILE="/tmp/disk_monitor.log"

THRESHOLD=80

log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}

log "Disk check started"

df -h | awk 'NR>1 {print $1,$5}' | while read disk use

do 
	usage=${use%\%}
	if [ "$usage" -gt "$THRESHOLD" ]; then
		log "WARNING: $disk usage is ${usage}%"
	fi
done

log "Disk check finished"



