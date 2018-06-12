# Sugarizer Linux Image For RPi Gen Script
## Introduction
This script is a fork of https://github.com/drtyhlpr/rpi23-gen-image. we have customized it accordingly to make a Sugarizer Client
and Sugarizer Server ready raspbian image for rpi2/3.

## Usage 

```shell
cd sugarizer-school-box
sudo sh run.sh
```

## Flashing The Generated Raspbian Image

```shell
bmaptool copy ./images/*.img /dev/mmcblk0
```

### Some Important Instructions
- Find your sdcard's mount point and replace it with "mmcblk0" while flashing.
- After flashing , check the partition size on your sd card. If there is any free space , then extend the second partition manually to occupy the whole card storage.
- Default ssid is sugarizer and passphrase is 12345678. These can be changed in image_scripts/hotspot.sh by replacing every reference to  ```ap sugarizer 12345678``` with ```ap Your_SSID Your_Passphrase``` before starting a build.
- In the first boot, keep the rpi running for an hour. Docker images will be loaded and containers will be made , followed by network setup.Hotspot will not work during the first run. After an hour, reboot the pi.
- Wifi Hotspot will be active after 3-4 mins after reboot.
- After connecting , sugarizer will be accessible at 192.168.42.1:8080. 


### Debugging
Have a look at the dependencies and instructions here : https://github.com/drtyhlpr/rpi23-gen-image