sudo add-apt-repository -y ppa:longsleep/golang-backports
# update the OS
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install git
<<<<<<< HEAD:build.sh
wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz
tar xvzf go1.11.1.linux-amd64.tar.gz
rm go1.11.1.linux-amd64.tar.gz
=======

rm -r -f *zip*

rm -r -f *tar*

wget -O- https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz | tar xz

>>>>>>> 4b9d6109b718f15138c21e89626f439a0bd770f9:buildEncoderAndServerUbuntu.sh
go/bin/go get -d -v .
go/bin/go build
go/bin/go get -d -v .
go/bin/go build
<<<<<<< HEAD:build.sh
mkdir www logs
=======

mkdir -p www logs

mkdir -p ffmpeg
wget -O- "https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz" | tar xJ -C ffmpeg --strip-components 1

>>>>>>> 4b9d6109b718f15138c21e89626f439a0bd770f9:buildEncoderAndServerUbuntu.sh
