#!/bin/bash -e
SECONDS=0

echo "Starting Sugarizer"
while [ $(curl -s -o /dev/null -I -w "%{http_code}" 0.0.0.0:8080) -ne 200  ]
do
: #Waiting For Sugarizer to start
done

echo "Sugarizer Started in $(($SECONDS/3600))h $(($SECONDS%3600/60))m $(($SECONDS%3600%60))s"
sed -i '/^\//d' /etc/rc.local
systemctl reboot
