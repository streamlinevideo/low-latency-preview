#!/bin/bash

# instlal go repo

sudo add-apt-repository -y ppa:longsleep/golang-backports

# update the OS

sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get install -y yasm libx264-dev libfreetype6-dev golang-go libass-dev pkg-config texinfo build-essential automake autoconf libssl-dev

export GOPATH=$HOME/go export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

go get -d -v .

go build

mkdir www logs

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
