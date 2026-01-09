#!/bin/bash

#This script checks whether provided service is running or not

SERVICE=$1

if [ -z "$SERVICE" ]; then
	echo "Usage: $0 <service-name>"
	exit 1
fi

if systemctl is-active --quiet "$SERVICE"; then
	echo "$SERVICE is running"
else
        echo "$SERVICE is not running"
fi	

