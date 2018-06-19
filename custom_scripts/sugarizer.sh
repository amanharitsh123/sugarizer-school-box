#Cloning all Required Repositories
git clone https://github.com/llaske/sugarizer ${R}/home/pi/sugarizer
git clone https://github.com/llaske/sugarizer-server ${R}/home/pi/sugarizer-server
git clone https://github.com/quangthanh010290/RPI3_HOTSPOTS.git ${R}/home/pi/RPI3_HOTSPOTS

#Copying Docker Images
cp -r ../docker-images ${R}/home/pi/

#Copying all required scripts to the image
cp ../image_scripts/script.sh ${R}/home/pi/
cp ../image_scripts/hotspot.sh ${R}/home/pi/
cp ../image_scripts/status.sh ${R}/home/pi/
rm ${ETC_DIR}/rc.local
cp ../image_scripts/rc.local ${ETC_DIR}/

#Optimizing Sugarizer
cd ${R}/home/pi/sugarizer
npm install
grunt
cp -r build/* .
