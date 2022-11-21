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

# Wait for camera
camera=$(gphoto2 --auto-detect | grep usb)
while [ -z "$camera" ]; do
	sleep 1
	camera=$(gphoto2 --auto-detect | grep usb)
done

# Read busid from the .busid file
# Bind usbip
sudo usbipd -D
busid=$(head -n 1 "$HOME/.busid")
sudo usbip bind -b $busid

# Waite for camera to be turned off
while [ ! -z "$camera" ]; do
	sleep 1
	camera=$(gphoto2 --auto-detect | grep usb)
done

sudo poweroff
