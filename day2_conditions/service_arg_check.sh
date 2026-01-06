#!/bin/bash

SERVICE=$1

if systemctl is-active --quiet $SERVICE; then
	echo "Service $SERVICE is running"
else
        echo "Service $SERVICE is not running"
fi	
