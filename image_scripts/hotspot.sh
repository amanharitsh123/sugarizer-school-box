#!/bin/bash -e
echo "Configuring Hotspot"
cd /home/pi/RPI3_HOTSPOTS

#Getting Ethernet Device name 
a=$(ifconfig -a | grep -wo en.*:)

echo "Device Name is ${a::-1}"

#Replacing all references to eth0 with the ethernet connection name
sed -i -e "s/eth0/${a::-1}/g" *

#Setting up
sh install.sh

#starting AP
ap sugarizer 12345678

sed -i '/^exit/d' /etc/rc.local
sed -i '/^bash/d' /etc/rc.local
echo -e "ifconfig wlan0 up\nap sugarizer 12345678\nexit 0" >> /etc/rc.local
