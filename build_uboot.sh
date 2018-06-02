#!/bin/sh
make ARCH=arm CROSS_COMPILE=/home/yxw/arm64/tool/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- qemu_arm64_defconfig
make ARCH=arm CROSS_COMPILE=/home/yxw/arm64/tool/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
sudo qemu-system-aarch64 -M virt -cpu cortex-a53 -m 512M -kernel u-boot -nographic
