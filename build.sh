sudo add-apt-repository -y ppa:longsleep/golang-backports
# update the OS
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install git
wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
tar xvzf go1.11.1.linux-amd64.tar.gz
rm go1.11.1.linux-amd64.tar.gz
go/bin/go get -d -v .
go/bin/go build
go/bin/go get -d -v .
go/bin/go build
mkdir www logs
