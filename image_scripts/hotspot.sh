#!/bin/bash -e
echo "Configuring Hotspot"

ssid="SugarizerSchoolBox"
pass="sugarizer"

cd /home/pi/RPI3_HOTSPOTS

#Getting Ethernet Device name 
a=$(ifconfig -a | grep -wo en.*:)

echo "Device Name is ${a::-1}"

#Replacing all references to eth0 with the ethernet connection name
sed -i -e "s/eth0/${a::-1}/g" *

ifconfig wlan0 up

#Setting up
sh install.sh

ifconfig wlan0 up

#starting AP
ap $ssid $pass

