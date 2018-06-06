cd /home/pi/docker-images 
sudo docker load -i mongodb.docker 
sudo docker load -i node.docker 
cd /home/pi/sugarizer-server 
sh gene*
sudo docker-compose up -d 
