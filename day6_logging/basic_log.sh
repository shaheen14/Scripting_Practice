#!/bin/bash

# this script shows how to append logs in a file

LOG_FILE="/tmp/basic.log"

echo "Script started at $(date)" >> "$LOG_FILE"

echo "Doing some work..." >> "$LOG_FILE"

echo "Script ended at $(date)" >> "$LOG_FILE"
