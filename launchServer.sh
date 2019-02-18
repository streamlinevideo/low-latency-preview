#!/bin/bash

go/bin/go run main.go "./www" ${1} 2>logs/server.log &
