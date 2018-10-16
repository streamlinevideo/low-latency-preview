#!/bin/bash

sudo apt-get update

sudo apt-get -y upgrade

sudo add-apt-repository -y ppa:longsleep/golang-backports

sudo apt-get update -y

sudo apt-get install -y golang-go

export GOPATH=$HOME/go export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

go get -d -v .

mkdir www
