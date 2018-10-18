#!/bin/bash

# By default install dependencies
if [ $1 != "--no-deps" ]; then
  ./installDeps.sh
fi

export GOPATH=$HOME/go export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

go get -d -v .

go build

mkdir -p www logs
