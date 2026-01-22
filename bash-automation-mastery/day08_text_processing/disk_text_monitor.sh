#!/bin/bash

#This script uses advanced text processing tools such as grep,awk,sed and pipes # to minitor disk and saves the logs in a file. 

LOG_FILE="/tmp/disk_text.log"

df -h | grep -v Filesystem | awk '{print $1,$5}' | sed 's/%//' | while read disk usage

do
	if [ "$usage" -gt 40 ]; then
		echo "$(date '+%F %T') WARNING: $disk at ${usage}%" >> "$LOG_FILE"
	fi
done


