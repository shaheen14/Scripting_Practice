#!/bin/bash

# this script checks multiple services

SERVICES="sshd cron docker"

for service in $SERVICES
do
	if systemctl is-active --quiet $service; then
		echo "Service $service is running"
	else
	        echo "Service $service is not running"
	fi
done	
