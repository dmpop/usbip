# USBIP

Shell scripts tat transform a Raspberry Pi into a USB-over-IP camera server.

# Requirements

- Raspberry Pi running the latest version of the Raspberry Pi OS Lite system

## Installation

On the Raspberry Pi, run the following command (replace `CAMERA_MAKER` with the actual camera manufacturer, for example: `Nikon`, `Canon`, `Sony`, etc.):

```
bash <(curl -sSL https://raw.githubusercontent.com/dmpop/usbip/main/install.sh) CAMERA_MAKER
```

## Author

Dmitri Popov [dmpop@linux.com](mailto:dmpop@tokyoma.de)

## License

The [GNU General Public License version 3](http://www.gnu.org/licenses/gpl-3.0.en.html)
