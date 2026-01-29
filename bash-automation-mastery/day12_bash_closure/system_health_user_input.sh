#!/bin/bash

# Author: Shaheen
# Purpose: This is a production level Script checks system cpu,memory usage and # failed  ssh login attempts according to user selected arguments, threshold is # accepted can also be provided by user

set -euo pipefail

#---------------------
# Default Values
#--------------------

CHECK_DISK=false
CHECK_MEM=false
CHECK_SSH=false


DISK_THRESHOLD=60
MEM_THRESHOLD=70
SSH_THRESHOLD=5

LOGFILE="/tmp/sys_monitor.log"

#------------------
# Usage function
#-----------------

usage() {
	echo "Usage: $0 [-d] [-m] [-s] [-D disk%] [-M mem%] [-S ssh_count]"
	echo " -d Check disk usage"
	echo " -m Check memory usage"
	echo " -s Check SSH failures"
	echo " -D Disk Threshold (default:60%)"
	echo " -M Memory Threshold (default:70%)"
	echo " -S SSH Failure Threshold (default:5)"
	exit 1
}

#-------------------
# Parse Arguments
#------------------

while getopts "dmsD:M:S:" opt; do
	case "$opt" in
		d) CHECK_DISK=true ;;
		m) CHECK_MEM=true ;;
		s) CHECK_SSH=true ;;
		D) DISK_THRESHOLD="$OPTARG" ;;
		M) MEM_THRESHOLD="$OPTARG" ;;
		S) SSH_THRESHOLD="$OPTARG" ;;
		*) usage ;;
	esac
   done
# if no check selected -> show usage

if ! $CHECK_DISK && ! $CHECK_MEM && ! $CHECK_SSH; then
	usage
fi

#-----------------------
# Logging function
#----------------------

log() {
	echo "$(date '+%F %T') - $1" | tee -a "$LOGFILE"
      }	

#----------------
# Disk Check
#---------------

check_disk() {
	log "Checking Disk Usage...."
	df -P | awk 'NR>1 {print $1,$5}' | sed 's/%//' | while read disk use
do

	if [ "$use" -gt $DISK_THRESHOLD ]; then
		log "WARNING: Disk usage on $disk is ${use}% (Threshold ${DISK_THRESHOLD}%)"
	else
	        log "OK: $disk usage is ${use}%" 	
	fi	
done
}

#--------------
# Memory Check
#-------------

check_mem() {
	log "Checking Memory Usage...."
	mem_used=$(free -m | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
	if (( mem_used > MEM_THRESHOLD )); 
	then
            log "ALERT: Memory usage is ${mem_used}%"
        else 
            log "Memory usage is Normal: ${mem_used}%"
        fi
               }
#------------
# SSH Failure Check
#------------

check_ssh() {
	log "Checking SSH Failures...."
	fails=$(journalctl -u ssh -u sshd --since "1 hour ago" 2>/dev/null | awk '/Failed password/ {c++} END {print c+0}')
	if (( fails > SSH_THRESHOLD ));then
		log "ALERT: SSH failed attempts = $fails"
	else
	        log "SSH failures within limit: $fails"
	fi
            }

#------------
# Execute selected checks
#------------
log " System Health Monitoring Started"

$CHECK_DISK && check_disk
$CHECK_MEM && check_mem
$CHECK_SSH && check_ssh

log "Monitoring Completed Successfully"











