#!/bin/bash

# Use sudo only if not using root

sudo ()
{
    [[ $EUID = 0 ]] || set -- command sudo "$@"
    "$@"
}

# install go repo

sudo add-apt-repository -y ppa:longsleep/golang-backports

# update the OS

sudo apt-get -y update

sudo apt-get -y upgrade
sudo apt-get install -y git yasm libx264-dev libfreetype6-dev golang-go libass-dev pkg-config texinfo build-essential automake autoconf libssl-dev software-properties-common python-software-properties git

# Download and compile FFmpeg

rm -r -f ffmpeg/

git clone http://github.com/FFmpeg/ffmpeg.git -b master

cd ffmpeg

# Configure FFmpeg build

./configure \
  --enable-gpl \
  --enable-libass \
  --enable-libx264 \
  --enable-nonfree \
  --enable-openssl \
  --enable-libfreetype

# Build ffmpeg

make

cd ..