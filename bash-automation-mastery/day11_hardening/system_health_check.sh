#!/bin/bash
set -euo pipefail

# Author: Shaheen
# Purpose: Imporved day 7 system health script into Unified System health check
# Day 11 : Final Bash Integration


LOG_FILE="/tmp/system_health.log"
DISK_THRESHOLD=60
MEM_THRESHOLD=80
usage() {
	echo "Usage: $0 [-d] [-m] [-s]"
	echo " -d  Check disk"
	echo " -m  Check memory"
	echo " -s  Check SSH failures"
	exit 1
}

[ "$#" -eq 0 ] && usage 

while getopts "dms" opt; do
	case "$opt" in
		d) CHECK_DISK=true ;;
	        m) CHECK_MEM=true ;;
	        s) CHECK_SSH=true ;;
	        *) usage ;;
	esac
done

# logging function
log() {
	echo "$(date '+%F %T') : $1" >> "$LOG_FILE"
}

# disk usage check

check_disk() {
	log "Checking Disk Usage"

	df -P | awk 'NR>1 {print $1,$5}' | while read disk use

do
	usage=${use%\%}
	if [ "$usage" -gt "$DISK_THRESHOLD" ]; then
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
	   if [ "$percent" -gt "$MEM_THRESHOLD" ]; then
		   log "WARNING: Memory Usage is ${percent}%"
           else
                   log "OK: Memory Usage is ${percent}%"
           fi		   
   done	   
}

# check SSH login failed attempts

check_ssh() {
    failed=$(grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l || true)
    # /var/log/auth.log is distro dependent
    if [ "$failed" -gt 5 ]; then
        log "WARNING: $failed failed SSH login attempts"
    else
        log "OK: SSH failures within limit ($failed)"
    fi
}


# setting variables

: "${CHECK_DISK:=false}"
: "${CHECK_MEM:=false}"
: "${CHECK_SSH:=false}"

# Main Execution of functions 

log "==================System Health Check Started=================="

$CHECK_DISK && check_disk
$CHECK_MEM && check_memory
$CHECK_SSH && check_ssh

log "==================System Health Check Finished================="


	       

