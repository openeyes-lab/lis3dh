#!/bin/bash

kernel_ver=$(uname -r)

version=${kernel_ver%.*}.y

URL="https://raw.githubusercontent.com/raspberrypi/linux/rpi-$version/drivers/iio"

# Check if build dir exist

if [ -d "build" ]; then	
	rm build/*.c
	rm build/*.h

	wget $URL/accel/st_accel.h -P build
	wget $URL/accel/st_accel_buffer.c -P build
	wget $URL/accel/st_accel_core.c -P build
	wget $URL/accel/st_accel_i2c.c -P build
	wget $URL/common/st_sensors/st_sensors_buffer.c -P build
	wget $URL/common/st_sensors/st_sensors_core.c -P build
	wget $URL/common/st_sensors/st_sensors_core.h -P build
	wget $URL/common/st_sensors/st_sensors_i2c.c -P build
	wget $URL/common/st_sensors/st_sensors_trigger.c -P build
	if [ $? -ne 0 ]; then
                echo -e "\e[31mERROR!!! failed to get files\e[39m"
                exit -1
	fi    
else
	echo -e "\e[31mERROR!!! build directory doesn't exist\e[39m"
	exit -1
fi
