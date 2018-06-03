#!/bin/sh

#########
# build busybox
#########
cd busybox-1.28.4
make menuconfig
	# enable static bin and add  cross compiler prefix
	# [*] Build busybox as a static binary
	# Cross compiler prefix (/home/yxw/arm64/gcc-....)
make
make install

#########
# make ramdisk fs image
#########
cd busybox-1.28.4/_install
mkdir proc sys dev etc etc/init.d
cd etc/init.d
echo > rcS
echo "#!/bin/sh" > rcS
echo "mount -t proc none /proc" >> rcS
echo "mount -t sysfs none /sys" >> rcS
echo "/sbin/mdev -s" >> rcS
chmod 777 rcS

cd ../..
dd if=/dev/zero of=ramdisk.img bs=1M count=64
mkfs.ext4 ramdisk.img
mkdir tmpfs
mount ramdisk.img tmpfs
cd tmpfs
cp -R busybox-1.28.4/_install/* tmpfs
umount tmpfs

