#!/bin/bash
sudo rm -rf rootfs
sudo rm -rf tmpfs
sudo rm -rf ramdisk*
sudo mkdir rootfs
sudo cp /home/yxw/arm64/busybox-1.28.4/_install/*  rootfs/ -raf
sudo mkdir -p rootfs/proc/
sudo mkdir -p rootfs/sys/
sudo mkdir -p rootfs/tmp/
sudo mkdir -p rootfs/root/
sudo mkdir -p rootfs/var/
sudo mkdir -p rootfs/mnt/
sudo cp etc rootfs/ -arf
sudo mkdir -p rootfs/lib
sudo cp -arf /home/yxw/arm64/tool/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/libc/lib/* rootfs/lib/
sudo rm rootfs/lib/*.a
sudo /home/yxw/arm64/tool/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-strip rootfs/lib/*
sudo mkdir -p rootfs/dev/
sudo mknod rootfs/dev/tty1 c 4 1
sudo mknod rootfs/dev/tty2 c 4 2
sudo mknod rootfs/dev/tty3 c 4 3
sudo mknod rootfs/dev/tty4 c 4 4
sudo mknod rootfs/dev/console c 5 1
sudo mknod rootfs/dev/null c 1 3
sudo dd if=/dev/zero of=ramdisk bs=1M count=16
sudo mkfs.ext4 -F ramdisk
sudo mkdir -p tmpfs
sudo mount -t ext4 ramdisk ./tmpfs/  -o loop
sudo cp -raf rootfs/*  tmpfs/
sudo umount tmpfs
sudo gzip --best -c ramdisk > ramdisk.gz
sudo mkimage -n "ramdisk" -A arm -O linux -T ramdisk -C gzip -d ramdisk.gz ramdisk.img
