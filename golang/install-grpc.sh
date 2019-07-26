#!/bin/bash
set -e

cur=$PWD
echo $cur
git clone https://github.com/grpc/grpc-go.git $GOPATH/src/google.golang.org/grpc
git clone https://github.com/golang/net.git $GOPATH/src/golang.org/x/net
git clone https://github.com/golang/text.git $GOPATH/src/golang.org/x/text

go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
git clone https://github.com/google/go-genproto.git $GOPATH/src/google.golang.org/genproto

cd $GOPATH/src/
go install github.com/golang/protobuf/protoc-gen-go

cd $cur
pbrelease=3.9.0
pbzip=protoc-"$pbrelease"-linux-x86_64.zip
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-x86_64.zip

unzipbin="/usr/bin/unzip"
if [ ! -e $unzipbin ];then
  apt install unzip -y
fi

tmppbdir=/tmp/pb
mkdir -p $tmppbdir
unzip $pbzip -d $tmppbdir 
cp -rf $tmppbdir/include/* /usr/local/include/

rm $tmppbdir -rf

