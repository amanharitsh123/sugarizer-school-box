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
sed -i '/^exit 0/d' /etc/rc.local
echo -e "ifconfig wlan0 up\nap $ssid $pass" >> /etc/rc.local
echo -e "sudo iptables -t nat -A POSTROUTING -o ${a::-1} -j MASQUERADE\nsudo iptables -A FORWARD -i ${a::-1} -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT\nsudo iptables -A FORWARD -i wlan0 -o ${a::-1} -j ACCEPT\nexit 0" >> /etc/rc.local
sh /home/pi/script.sh > /home/rc.local.log 2>&1 & 


