#!/bin/bash

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