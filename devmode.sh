#!/bin/bash

# A basic script that will turn local MySQL and Apache2 servers on or off
#
# I recommend added the following line to your ~/.bashrc file:
#
#	alias devmode="sh /home/christian/scripts/devmode.sh"
#
# Type `source ~/.bashrc` after editing the .bashrc file to reload it.
#
# Usage:
#	$ devmode on
#	$ devmode off
#

if [[ $1 == 'on' ]]; then
	echo "Enabling devmode..."
	echo "Starting Apache2..."
	sudo apachectl start
	echo "Starting MySQL server..."
	sudo systemctl start mysqld
	echo "Done!"

elif [[ $1 == 'off' ]]; then
	echo "Disabling devmode..."
	echo "Stopping Apache2..."
	sudo apachectl stop
	echo "Stopping MySQL server..."
	sudo systemctl stop mysqld
	echo "Done!"

fi
