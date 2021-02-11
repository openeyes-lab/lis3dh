# LIS3DH - Accelerometer Linux driver


[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](http://www.gnu.org/licenses/lgpl-3.0)

This repository contains Linux drivers for the ST Microelectronics lis3dh 3-axis accelerometer implemented on OPEN-EYES-RPI devices from OPEN-EYES S.r.L.

This driver is licensed under the Gnu Public License.

This driver is tested under the Linux 5.X kernels.

For more information about OPEN-EYES-RPI devices visit http://www.open-eyes.it

see https://www.st.com/en/mems-and-sensors/lis3dh.html for chipset references.

This driver is provided by the main line linux kernel, but not compiled into Raspberry OS by default. To avoid download of linux source and setup compilation, only the necessary files are extracted and compiled.

## Automatic install/uninstall

After cloning the repository to install driver execute:
```
cd lis3dh
bash install.sh
```
to uninstall execute:
```
cd lis3dh
bash uninstall.sh
```

# Interface involved

I2C1: address 0x18

# Filesys

industrial bus is created into /sys/bus/iio...

# Reference

## Industrial I/O

https://01.org/linuxgraphics/gfx-docs/drm/driver-api/iio/index.html
