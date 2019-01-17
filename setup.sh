#!/bin/bash

rpi-update

echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
echo "dwc2" | sudo tee -a /etc/modules
echo "libcomposite" | sudo tee -a /etc/modules

sed -i 's/exit/\/usr\/bin\/pi-meh_usb\nexit/' /etc/rc.local


# 128mb storage image for mass storage
dd if=/dev/zero of=/home/pi/pi-meh_usbdisk.img bs=1048576 count=128
mkdosfs /home/pi/pi-meh_usbdisk.img

cp pi-meh_usb /usr/bin/pi-meh_usb

git clone https://github.com/jonberenguer/hardpass-sendHID.git
cd hardpass-sendHID
make && make install

reboot


