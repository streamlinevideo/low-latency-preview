#!/bin/bash

cd utils

curl -O https://cdn.theunarchiver.com/downloads/unarMac.zip

unzip unarMac.zip

cd ..

rm -r -f ffmpeg/

mkdir ffmpeg

cd ffmpeg

# NOTE: This link will need to be updated whenever ffmpeg creates a new binary release
wget https://evermeet.cx/ffmpeg/ffmpeg-4.3.1.7z

../utils/unar ffmpeg-4.3.1.7z

rm ffmpeg-4.3.1.7z

cd ..

rm -r -f *zip*

rm -r -f *tar*

wget https://golang.org/dl/go1.15.7.darwin-amd64.tar.gz

tar xvzf go1.15.7.darwin-amd64.tar.gz 

rm go1.15.7.darwin-amd64.tar.gz  

go/bin/go mod init github.com/streamlinevideo/low-latency-preview

go/bin/go get -d -v .

go/bin/go build

rm -r -f www/

mkdir -p www logs

rm -r -f low-latency-preview-master
