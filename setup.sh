#!/bin/bash

git clone https://github.com/jonberenguer/hardpass-sendHID.git
cd hardpass-sendHID
make && make install


apt-get install -y dnsmasq
systemctl disable dnsmasq && systemctl stop dnsmasq
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

cat << 'EOF' > /etc/dnsmasq.conf
interface=usb0
  dhcp-range=172.16.254.2,172.16.254.2,255.255.255.0,1h
  dhcp-option=3
  dhcp-option=6
EOF


# must be kernel 4.14.90
# commit id found: https://github.com/Hexxeh/rpi-firmware/commits/master
# rpi-update <commit id>
#rpi-update da5948d

echo "dtoverlay=dwc2" | sudo tee -a /boot/config.txt
echo "dwc2" | sudo tee -a /etc/modules
echo "libcomposite" | sudo tee -a /etc/modules

# 128mb storage image for mass storage
dd if=/dev/zero of=/home/pi/pi-meh_usbdisk.img bs=1048576 count=128
mkdosfs /home/pi/pi-meh_usbdisk.img


cp /home/pi/pi-meh/pi-meh_usb /usr/bin/pi-meh_usb
cp /home/pi/pi-meh/pi-meh.service /etc/systemd/system/pi-meh.service

systemctl enable pi-meh.service


reboot
