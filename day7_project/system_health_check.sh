#!/bin/bash

# This script checks disk usage warns if threshold crossed,check memory usage,critical services and log all results to a file and allow user to set disk threshold

LOG_FILE="/tmp/system_health.log"
THRESHOLD=${1:-80} # default 80% if not provided

# logging function
log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}

# disk usage check

check_disk() {
	log "Checking Disk Usage"

	df -h | awk 'NR>1 {print $1,$5}' | while read disk use

do
	usage=${use%\%}
	if [ "$usage" -gt "$THRESHOLD" ]; then
		log "WARNING: $disk usage is ${usage}%"
	else
	        log "OK: $disk usage is ${usage}%"
	fi
done
}

# memory check

check_memory() {
           log "Checking Memory Usage"

	   free -m | awk '/Mem:/ {print $3,$2}'| while read used total
   do
           percent=$(( used * 100 / total ))
           log "Memory Usage: ${percent}%"
   done	   
}

# Service check

check_service() {
	SERVICE=$1
	if systemctl is-active --quiet "$SERVICE"; then
		log "Service $SERVICE is running"
	else
	        log "Service $SERVICE is not running"
	fi
}

# Main Execution of functions 

log "==================System Health Check Started=================="

check_disk
check_memory
check_service ssh
check_service cron

log "==================System Health Check Finished================="


	       

