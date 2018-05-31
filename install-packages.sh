#!/bin/bash

sudo yum install -y php56w-common-5.6.16-1.w7.x86_64.rpm
sudo yum install -y php56w-cli-5.6.16-1.w7.x86_64.rpm
sudo yum install -y php56w-5.6.16-1.w7.x86_64.rpm

sudo yum install -y quilt-0.63-2.el7.noarch.rpm
sudo yum install -y ncurses-devel.x86_64
sudo yum install -y dbus-devel.x86_64

sudo yum remove -y x264-devel
sudo yum install -y x264-0.148-1.x86_64.rpm
sudo yum install -y x265-devel.x86_64
sudo yum install -y libcdio-paranoia-devel-10.2+0.90-11.el7.x86_64.rpm
sudo yum install -y libcurl-devel.x86_64
sudo yum install -y libogg-devel-1.3.0-7.el7.x86_64.rpm
sudo yum install -y libtheora-devel-1.1.1-8.el7.x86_64.rpm
sudo yum install -y libuuid-devel.x86_64
sudo yum install -y libvorbis-devel-1.3.3-8.el7.x86_64.rpm

sudo yum install -y pulseaudio-libs-devel.x86_64
sudo yum install -y freetype-devel.x86_64
sudo yum install -y libiodbc-devel-3.52.7-7.el7.x86_64.rpm
sudo yum install -y libevent-devel-2.0.21-4.el7.x86_64.rpm
sudo yum install -y json-c-devel-0.11-4.el7_0.x86_64.rpm
sudo yum remove -y xvidcore.x86_64
sudo yum install -y xvidcore-1.3.4-1.x86_64.rpm
sudo yum install -y php56w-devel-5.6.16-1.w7.x86_64.rpm
sudo yum install -y bzip2-devel.x86_64


