#!/bin/bash

# this script check multiple services provided in arguments

if [ "$#" -eq 0 ]; then
	echo "Usage: $0 <service1> <service>..."
	exit 1
fi

for service in "$@"

do
	if systemctl is-active --quiet "$service"; then
		echo "$service is running"
	else
	        echo "$service is not running"
	fi
done	
