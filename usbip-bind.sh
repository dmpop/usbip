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

# Read busid and camera maker from the .usbip.conf file
busid=$(sed -n '1p' "$HOME/.usbip.conf")
camera=$(sed -n '2p' "$HOME/.usbip.conf")

# Wait for camera
status=$(lsusb | grep "$camera")
while [ -z "$status" ]; do
	sleep 1
	status=$(lsusb | grep "$camera")
done

# Bind usbip
sudo usbipd -D
sudo usbip bind -b $busid

# Waite for camera to be turned off
while [ ! -z "$status" ]; do
	sleep 1
	status=$(lsusb | grep "$camera")
done

sudo poweroff
