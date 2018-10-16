#!/bin/bash

# update the OS

sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get install -y yasm libx264-dev libfreetype6-dev golang-go

go get -d -v .

go build

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
