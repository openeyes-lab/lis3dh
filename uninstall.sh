
#!/bin/bash

sudo rm /boot/overlays/lis3dh-accel.dtbo

sudo sed -i -e "/lis3dh-accel/d" /boot/config.txt

sudo rm /lib/modules/$(uname -r)/kernel/drivers/iio/accel/st_accel_i2c.ko
sudo rm /lib/modules/$(uname -r)/kernel/drivers/iio/accel/st_accel.ko
sudo rm /lib/modules/$(uname -r)/kernel/drivers/iio/common/st_sensors/st_sensors_i2c.ko
sudo rm /lib/modules/$(uname -r)/kernel/drivers/iio/common/st_sensors/st_sensors.ko

echo "lis3dh driver and device tree correctly uninstalled: reboot to make effective"
