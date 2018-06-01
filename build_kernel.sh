#!/bin/sh
cross_compile=/home/yxw/arm64/tool/gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
make CROSS_COMPILE=$cross_compile ARCH=arm64 O=./out_aarch64 defconfig
make CROSS_COMPILE=$cross_compile ARCH=arm64 O=./out_aarch64 menuconfig
make CROSS_COMPILE=$cross_compile ARCH=arm64 O=./out_aarch64 Image -j4
