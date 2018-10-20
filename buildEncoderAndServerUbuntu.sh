#!/bin/bash

# install go repo

sudo add-apt-repository -y ppa:longsleep/golang-backports

# update the OS

sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get -y install git

rm -r -f *zip*

rm -r -f *tar*

wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz

tar xvzf go1.11.1.linux-amd64.tar.gz

rm go1.11.1.linux-amd64.tar.gz

go/bin/go get -d -v .

go/bin/go build

go/bin/go get -d -v .

go/bin/go build

rm -r -f www logs

mkdir www logs

wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz

tar xf ffmpeg-git-64bit-static.tar.xz

mv ffmpeg-git-20181018-64bit-static/ ffmpeg/

rm ffmpeg-git-64bit-static.tar.xz

rm low-latency-preview-master/

