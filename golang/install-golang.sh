#!/bin/bash

release=1.11.1
targz=go$release.linux-amd64.tar.gz

if [ -ne $GOROOT ];then
   echo "must set GOROOT env"
   exit -1
fi 

if [ -d $GOROOT ];then
   echo "GOROOT:$GOROOT path not exist"
   exit -1
fi 

wget https://dl.google.com/go/$targz
tar -xvzf targz -C /tmp
mv /tmp/go $GOROOT



