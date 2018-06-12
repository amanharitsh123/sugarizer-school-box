
git clone https://github.com/llaske/sugarizer ${R}/home/pi/sugarizer
git clone https://github.com/llaske/sugarizer-server ${R}/home/pi/sugarizer-server
git clone https://github.com/quangthanh010290/RPI3_HOTSPOTS.git ${R}/home/pi/RPI3_HOTSPOTS
cp -r ../docker-images ${R}/home/pi/
cp ../image_scripts/hotspot.sh ${R}/home/pi/
rm ${ETC_DIR}/rc.local
cp ../image_scripts/rc.local ${ETC_DIR}/

