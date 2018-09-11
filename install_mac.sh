#!/usr/bin/env bash

SCRIPTDIR=$( cd "$( dirname "$0" )" && pwd )
DIR=${"$DIR"-"SCRIPTDIR"}
$DIR/header.sh "Detected Mac install"

$DIR/header.sh "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$DIR/header.sh "Updating git"

sudo brew install git python3
ln $DIR/.bashrc $HOME/.bash_profile
