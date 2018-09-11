#!/usr/bin/env bash

DIR=$( cd "$( dirname "$0" )" && pwd )
$DIR/header.sh "Detected Linux install" "    package manager: $1"

sudo $1 install vim git 
ln $DIR/.bashrc $HOME/.bashrc

