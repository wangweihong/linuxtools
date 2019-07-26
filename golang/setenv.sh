#!/bin/bash

set -e 

bashrc=$HOME/.bashrc

GOROOT=${GOROOT:-/usr/local/go}
GOPATH=${GOPATH:-$HOME/go}
GOBIN=${GOBIN:-$GOPATH/bin}

mkdir -p $GOROOT
mkdir -p $GOPATH
mkdir -p $GOPATH/src
mkdir -p $GOPATH/bin
mkdir -p $GOPATH/pkg

echo "GOROOT=\"$GOROOT\"" >> $bashrc
echo "GOPATH=\"$GOPATH\"" >> $bashrc
echo "GOBIN=\"$GOBIN\"" >> $bashrc
echo 'PATH="$PATH:$GOPATH"' >> $bashrc


#source this file to export 
export GOROOT=$GOROOT
export GOPATH=$GOPATH
export GOBIN=$GOBIN
export PATH=$PATH:$GOPATH:$GOROOT/bin
