#!/bin/sh
source $HOME/.dotfiles/log.sh

echo "Please enter your golang path (ex: $HOME/golang) :"
read gopath
 
echo "Please enter your github username (ex: vsouza) :"
read user
 
 
mkdir $gopath
mkdir -p $HOME/$gopath/src/github.com/$user
 
export GOPATH=$gopath
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
 
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)" }
brew update && brew upgrade
brew install go
brew install git
brew install mercurial
 
go get code.google.com/p/go.tools/cmd/godoc
go get code.google.com/p/go.tools/cmd/vet
 
echo "go to https://golang.org/doc/code.html and enjoy :D"

