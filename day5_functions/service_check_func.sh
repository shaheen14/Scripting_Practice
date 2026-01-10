#!/bin/bash

# The function can accept arguments just like script
#this script shows how function accepts arguments

check_service() {

SERVICE=$1

if systemctl is-active --quiet "$SERVICE"; then
	echo "Service $SERVICE is running"
else 
        echo "Service $SERVICE is not running"
fi
}
check_service sshd
check_service apache


