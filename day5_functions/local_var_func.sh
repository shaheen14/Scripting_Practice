#!/bin/bash

# this script shows the use of local and global variable use

USERNAME="admin"

check_user_with_loc() {
	local USERNAME=$1
	echo "Checking Username function with local variable: $USERNAME"
}
check_user_with_loc testuser
echo "Outside Function with local: $USERNAME"

check_user_without_loc() {
	USERNAME=$1
	echo "Checking Username function without local variable: $USERNAME"
}
check_user_without_loc testuser
echo "Outside Function Without local: $USERNAME"
