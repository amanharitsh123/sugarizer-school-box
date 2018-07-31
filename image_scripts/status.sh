#!/bin/bash -e
SECONDS=0

echo "Starting Sugarizer"
while [ $(curl -s -o /dev/null -I -w "%{http_code}" 0.0.0.0:8080) -ne 200  ]
do
: #Waiting For Sugarizer to start
done

echo "Sugarizer Started in $(($SECONDS/3600))h $(($SECONDS%3600/60))m $(($SECONDS%3600%60))s"
sed -i '/^\//d' /etc/rc.local

#Ownership changed
chown -R pi /home/pi/*
chgrp -R pi /home/pi/*

#Deleting Docker Images
rm -r /home/pi/docker-images

#Disabling Logging by making partition read-only
echo "none /var/log tmpfs size=1M,noatime 00" >> /etc/fstab

#Setting up nginx log files after boot

sed -i '/^exit 0/d' /etc/rc.local
echo "mkdir /var/log/nginx" >> /etc/rc.local
echo "touch /var/log/nginx/error.log" >> /etc/rc.local
echo "touch /var/log/nginx/access.log" >> /etc/rc.local
echo "exit 0" >>  /etc/rc.local

#Rebooting System
systemctl reboot