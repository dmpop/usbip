# USBIP

Shell scripts tat transform a Raspberry Pi into a USB-over-IP camera server.

# Requirements

- Raspberry Pi running the latest version of the Raspberry Pi OS Lite system

## Installation

On the Raspberry Pi, run the following command (replace `[device_id]` with the actual device ID, that can be obtained using the `lsusb` command):

```
bash <(curl -sSL https://raw.githubusercontent.com/dmpop/usbip/main/install.sh) [device_id]
```

For example:

```
bash <(curl -sSL https://raw.githubusercontent.com/dmpop/usbip/main/install.sh) "04b0:042a"
```

The [Linux Photography](https://gumroad.com/l/linux-photography) book provides detailed instructions on installing and using USBIP. Get your copy at [Google Play Store](https://play.google.com/store/books/details/Dmitri_Popov_Linux_Photography?id=cO70CwAAQBAJ) or [Gumroad](https://gumroad.com/l/linux-photography).

<img src="https://tokyoma.de/bookcovers/linux-photography.jpg" title="Linux Photography book" width="200"/>

## Author

Dmitri Popov [dmpop@linux.com](mailto:dmpop@tokyoma.de)

## License

The [GNU General Public License version 3](http://www.gnu.org/licenses/gpl-3.0.en.html)
