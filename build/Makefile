
obj-m += st_accel_i2c.o
obj-m += st_sensors_i2c.o

obj-m += st_sensors.o
st_sensors-objs := st_sensors_core.o st_sensors_trigger.o st_sensors_buffer.o

obj-m += st_accel.o
st_accel-objs := st_accel_core.o st_accel_buffer.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	sudo cp st_accel_i2c.ko /lib/modules/$(shell uname -r)/kernel/drivers/iio/accel
	sudo cp st_accel.ko /lib/modules/$(shell uname -r)/kernel/drivers/iio/accel
	sudo cp st_sensors_i2c.ko /lib/modules/$(shell uname -r)/kernel/drivers/iio/common/st_sensors
	sudo cp st_sensors.ko /lib/modules/$(shell uname -r)/kernel/drivers/iio/common/st_sensors
	sudo depmod -a

load:
	sudo insmod lis3dh-acc.ko

reload:
	sudo rmmod lis3dh-acc.ko
	sudo insmod lis3dh-acc.ko
