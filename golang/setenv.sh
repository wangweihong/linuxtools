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

echo "export GOROOT=\"$GOROOT\"" >> $bashrc
echo "export GOPATH=\"$GOPATH\"" >> $bashrc
echo "export GOBIN=\"$GOBIN\"" >> $bashrc
echo 'export PATH="$PATH:$GOPATH:$GOROOT/bin"' >> $bashrc

