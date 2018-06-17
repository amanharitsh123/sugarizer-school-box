#!/bin/sh -e
echo "Starting Script" 
cd /home/pi/docker-images/
docker load -i mongodb.docker 
docker load -i node.docker
cd /home/pi/sugarizer-server/
sh gene*
docker-compose up -d 
sed -i '/^bash/d' /etc/rc.local
exit 0

