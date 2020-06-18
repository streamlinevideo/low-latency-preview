#!/bin/bash

# install go repo

sudo add-apt-repository -y ppa:longsleep/golang-backports

# update the OS

sudo apt-get -y update

sudo apt-get -y upgrade

sudo apt-get -y install git

rm -r -f *zip*

rm -r -f *tar*

wget -O- https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz | tar xz

go/bin/go get -d -v .

go/bin/go build

go/bin/go get -d -v .

go/bin/go build

mkdir -p www logs

mkdir -p ffmpeg
wget -O- "https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz" | tar xJ -C ffmpeg --strip-components 1

