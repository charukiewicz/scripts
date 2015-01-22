#!/bin/bash

# Hosts file update script.  Written by Christian Charukiewicz.
#
# --------------- Updated: July-15-2014 ------------------
#
# Grabs the hosts files from the following two websites:
#
#	- http://winhelp2002.mvps.org/
#	- http://someonewhocares.org/hosts/
#
# Appends the contents of both hosts files to your local /etc/hosts file.
#
# Will also create a /etc/hosts-original the first time you run the script
# as a backup/starting point.

echo "Checking if copy of original hosts file exists..."
if [ -e /etc/hosts-original ]
	then
		echo "Copy of original exists."
		cat /etc/hosts-original > /etc/hosts	
	else
		echo "Copy of original does not exist.  Copying..."
		cat /etc/hosts > /etc/hosts-original
fi

echo "Downloading mvps.org hosts file..."
wget http://winhelp2002.mvps.org/hosts.txt --output-document=hosts-mvps

echo "Downloading someonewhocares.org hosts file..."
wget http://someonewhocares.org/hosts/zero/hosts --output-document=hosts-swc

echo "Adding mvps.org hosts file content to main hosts file..."
cat hosts-mvps >> /etc/hosts
echo "Adding someonewhocares.org hosts file content to main hosts file..."
cat hosts-swc >> /etc/hosts

echo "Cleaning up..."
rm hosts-mvps
rm hosts-swc

echo "Completed!"
