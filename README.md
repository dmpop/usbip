# USBIP

Shell scripts that transform a single-board computer (SBC) running a Debian-based system into a USB-over-IP camera server.

# Requirements

- SBC running the latest version of a Debian or Ubuntu-based Linux distribution like [DietPi](https://dietpi.com) system

## Installation

On the SBC, run the following command (replace `[device_id]` with the actual device ID, that can be obtained using the `lsusb` command):

```
bash <(curl -sSL https://raw.githubusercontent.com/dmpop/usbip/main/install.sh) [device_id]
```

For example:

```
bash <(curl -sSL https://raw.githubusercontent.com/dmpop/usbip/main/install.sh) "04b0:042a"
```

The [Linux Photography](https://gumroad.com/l/linux-photography) book provides detailed instructions on installing and using USBIP. Get your copy at [Google Play Store](https://play.google.com/store/books/details/Dmitri_Popov_Linux_Photography?id=cO70CwAAQBAJ) or [Gumroad](https://gumroad.com/l/linux-photography).

<img src="https://cameracode.coffee/uploads/linux-photography.png" title="Linux Photography book" width="300"/>

## Author

Dmitri Popov [dmpop@cameracode.coffee](mailto:cameracode.coffee)

## License

The [GNU General Public License version 3](http://www.gnu.org/licenses/gpl-3.0.en.html)
