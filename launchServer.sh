#!/bin/bash

sudo go run main.go "/.www" >/dev/null 2>server.log &
