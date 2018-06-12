#!/bin/sh 
echo "Starting Script" 
cd /home/pi/docker-images/
docker load -i mongodb.docker 
docker load -i node.docker
cd /home/pi/sugarizer-server/
sh gene*
docker-compose up -d 
exit 0

