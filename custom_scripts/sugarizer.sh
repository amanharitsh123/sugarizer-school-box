
git clone https://github.com/llaske/sugarizer ${R}/home/pi/sugarizer
git clone https://github.com/llaske/sugarizer-server ${R}/home/pi/sugarizer-server
cp -r ../docker-images ${R}/home/pi/
echo "sh /home/pi/script.sh &" >>"${ETC_DIR}/rc.firstboot"
cp ../image_scripts/script.sh ${R}/home/pi/

