#!/usr/bin/env bash

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

# Author: Dmitri Popov, dmpop@linux.com
# Source code: https://github.com/dmpop/usbip

# Read Device ID from the .usbip.conf file
id=$(sed -n '1p' "$HOME/.usbip.conf")

# Set ACT LED to heartbeat to indicated that script is running correctly 
if [ ! -z "$id" ]; then
	sudo bash -c "echo "heartbeat" >/sys/class/leds/led0/trigger"
fi

# Wait for camera
status=$(lsusb | grep "$id")
while [ -z "$status" ]; do
	sleep 1
	status=$(lsusb | grep "$id")
done

# Bind usbip
sudo usbipd -D
sudo usbip bind --$(sudo usbip list -p -l | grep "#usbid=$id#" | cut '-d#' -f1)

# Waite for camera to be turned off
while [ ! -z "$status" ]; do
	sleep 1
	status=$(lsusb | grep "$id")
done

sudo usbip unbind --$(sudo usbip list -p -l | grep "#usbid=$id#" | cut '-d#' -f1)
sudo poweroff
