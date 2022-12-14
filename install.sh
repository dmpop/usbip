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

if [[ $EUID -eq 0 ]]; then
        echo "Run the script as a regular user"
        exit 1
fi

cd
sudo apt update && sudo apt -y upgrade
sudo apt -y install git usbip hwdata
git clone https://github.com/dmpop/usbip.git
chmod +x usbip/*.sh
sudo sh -c "echo 'usbip_host' >> /etc/modules"
crontab -l | {
        cat
        echo "@reboot /home/"$USER"/usbip/usbip-bind.sh"
} | crontab
crontab -l | {
        cat
        echo "@reboot sudo /home/"$USER"/usbip/ip.sh"
} | crontab
echo "$1" >"$HOME/.usbip.conf"

echo "====="
echo "All done! Reboot the machine."
echo "Read the Linux Photography book for furher instructions:"
echo "https://dmpop.gumroad.com/l/linux-photography"
