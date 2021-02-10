#!/bin/bash

echo "Running script $0 with params $1"

if [ -z "$1" ]; then
	sudo apt update
	sudo apt upgrade -y
	echo "Checking headers installation"
	dpkg-query -s raspberrypi-kernel-headers
	if [ $? -eq 1 ]
	then
		sudo apt install -y raspberrypi-kernel-headers
	fi
fi

if dtc -@ -b 0 -I dts -O dtb -o lis3dh-accel.dtbo dts/lis3dh.dts ; then
	sudo chown root:root lis3dh-accel.dtbo
	sudo mv lis3dh-accel.dtbo /boot/overlays
else
	echo "fail to compile dts"
	exit
fi

if grep -q "dtoverlay=lis3dh-accel" /boot/config.txt ; then
	echo "confi.txt already prepared"
else
	echo "dtoverlay=lis3dh-accel" | sudo tee -a /boot/config.txt
fi

LIB="/lib/modules/$(uname -r)/kernel/drivers/iio/accel"
if [ ! -d "$LIB" ]; then
	sudo mkdir -p $LIB
fi

LIB="/lib/modules/$(uname -r)/kernel/drivers/iio/common/st_sensors"
if [ ! -d "$LIB" ]; then
        sudo mkdir -p $LIB
fi

cd build

make
if [ $? -ne 0 ]; then
    echo "Failed to make"
    echo -1
fi

make install
if [ $? -ne 0 ]; then
    echo "Failed to install"
    echo -1
fi

rm *.o
rm *.mod
rm modules.order
rm Module.symvers
rm *.mod.c
rm *.ko
rm .*.cmd

echo "lis3dh correctly installed: reboot to make effective"
