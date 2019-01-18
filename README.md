# pi-meh
raspberry pi - Mass storage, Ethernet and HID

tested with:
- 2018-11-13-raspbian-stretch-lite

tested on:
- pi zero w

# Post imaging, enable headless mode

Before removing the sd card from your imaging host, re-mount or ensure that sd card is still mounted.

Create a blank file file ssh in boot path:
```
touch <sdcard>/boot/ssh
```

Setup the wifi config:
```
cat << 'EOF' > <sdcard>/boot/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US
 
network={
	ssid="YOURSSID"
	psk="YOURPASSWORD"
	scan_ssid=1
}
EOF
```

Unmount the sd card and insert in your pi zero.


# Manual Setup

ssh to your pi and run the following commands:

```
sudo apt-get update && sudo apt-get install -y git

cd /home/pi && \
  git clone https://github.com/jonberenguer/pi-meh.git && \
  cd pi-meh && \
  sudo ./setup.sh
```

# Pi Pre-built Image

[Click Here for Releases and Images](https://github.com/jonberenguer/pi-meh/releases)






