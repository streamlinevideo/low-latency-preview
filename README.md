## Low Latency Media Http Server

This is a simple implementation of a http server which support partial-file upload/download.

In normal scenario, the file uploaded to a http server is only consumable after the uploading is done. For example, you start to upload the file at t0, and it takes T seconds to finish the upload. The client can only consume the file at t0 + T. This is fine for latency-insensitive scenarioes. 

But for some use cases, like live streaming, we do want to achieve the low latency by **killing the T seconds** file transfering time. The need is to be able to support file downloading while uploading.

This is what this server demostrates

## What is included?

This reference system is written in Go.
 - a main.go to boost the http server and set the url route rule
 - ./handle to implement the upload/download logic
 - ./util to implement logging, garbage collector etc


## Building the code

First, you need to install Golang
if Mac

	brew install go 

if Ubuntu

	sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get install -y golang-go

Once you have installed and rebooted, log in, then open up the program “terminal.” Now run the command…

	sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y install git

Now you can clone the repository to get the full code.

	cd ~/ && git clone https://github.com/codingtmd/ldash.git

Do not forget to download the missing library:

	go get -d -v .

Setup the environment by running:

	./build_ldash_server.sh

Go to the directory and build the code 

	go build

Then run it with fun

	sudo go run main.go "./www/"

And you will see the console output as below
![workflow](https://drive.google.com/uc?export=view&id=12abAkLz-dTZm4VbiBaGH9B_c4jO2F7iX)

If you need an IDE, normally I use [microsoft visual studio code](https://code.visualstudio.com/download "microsoft visual studio code") and [Go Plugin](https://code.visualstudio.com/docs/languages/go "Go Plugin")


## How to play with it

After the server is running, following endpoints will be open.
Upload Endpoint:
>  http://{yourdomain}:8080/ldash/upload/{folderpath}/{manifest}    

Example: 

	 curl http://localhost:8080/ldash/upload/2550/720p/123.mpd --upload-file $anyfile


Download Endpoint:
>  http://{yourdomain}:8080/ldash/download/{folderpath}/{manifest}

Example:

	 curl http://localhost:8080/ldash/download/2550/720p/123.mpd 


Play Endpoint:
>  http://{yourdomain}:8080/ldash/play/{folderpath}/{manifest}

Example:

	 put this into your browser http://localhost:8080/ldash/play/2550/720p/123.mpd 


## Things to know

The logging uses loggo. Plz check the configuration and usage here: https://github.com/juju/loggo

## Cool future work / Areas you can contribute / TODOs

 - Auto garbage collector to purge the expired segments older than X seconds
 - Add embed player support for dash
 - Add manifest re-preocessing in server-side
 - Support low-latency HLS as well

## Contact me

Leave me a message if you want to participate for fun.