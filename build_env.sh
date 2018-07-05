#!/bin/sh

mkdir arm64
cd arm64

# copy all files to there
##

# install cross compiler
mkdir tool
cp gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz tool/
cd tool
tar xvf gcc-linaro-6.3.1-2017.05-x86_64_aarch64-linux-gnu.tar.xz

# install necessary sw package
sudo apt install libcap-dev
sudo apt install libasound2-dev
sudo apt install gcc
sudo apt install pkg-config zlib1g-dev libglib2.0-dev libpixman-1-dev
sudo apt install libncurses5-dev

# install qemu
cp qemu-2.12.0.tar.xz .
tar xvf qemu-2.12.0.tar.xz
./qemu-2.12.0/configure --target-list=arm-softmmu,aarch64-linux-user,arm-linux-user,aarch64-softmmu --audio-drv-list=alsa --enable-virtfs
apt install python
apt install pkg-config
apt-get install zlib1g-dev
apt install libasound2-dev
apt install libglib2.0-dev
apt install libpixman-1-dev
make -j8
sudo make install

