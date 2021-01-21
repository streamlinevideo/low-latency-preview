#!/bin/bash

cd utils

curl -O https://cdn.theunarchiver.com/downloads/unarMac.zip

unzip unarMac.zip

cd ..

rm -r -f ffmpeg/

mkdir ffmpeg

cd ffmpeg

# NOTE: This link will need to be updated whenever ffmpeg creates a new binary release
wget https://evermeet.cx/ffmpeg/ffmpeg-100675-gf359575c0b.7z

../utils/unar ffmpeg-100675-gf359575c0b.7z

rm ffmpeg-100675-gf359575c0b.7z

cd ..

rm -r -f *zip*

rm -r -f *tar*

curl -O https://dl.google.com/go/go1.11.1.darwin-amd64.tar.gz

tar xvzf go1.11.1.darwin-amd64.tar.gz

rm go1.11.1.darwin-amd64.tar.gz

go/bin/go get -d -v .

go/bin/go build

rm -r -f www/

mkdir www

rm -r -f low-latency-preview-master
