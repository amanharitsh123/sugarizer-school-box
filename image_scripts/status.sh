#!/bin/bash -e
#Deactivating mmc0 trigger
echo none >/sys/class/leds/led0/trigger

#Blinking Green Light Until Sugarizer active and Listening on port 8080
while [ $(curl -s -o /dev/null -I -w "%{http_code}" 0.0.0.0:8080) -ne 200  ]
do
echo 1 >/sys/class/leds/led0/brightness
sleep 1
done

#changing Green LED to do its default fucntion

echo mmc0 >/sys/class/leds/led0/trigger
