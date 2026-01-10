#!/bin/bash

# This script checks the disk in function and function communicate using exit codes

check_disk() {
	df -h / | awk 'NR==2 {gsub("%","",$5); if ($5 > 80) exit 1}'
}

check_disk

if [ $? -ne 0 ]; then
	echo "Disk Usgae is high"
else
        echo "Disk Usage is normal"
fi	

