#!/usr/bin/env bash

###############################################################################
#
#  Install.sh
#   Author: Yoseph Radding
#   Description: Install.sh installs the tools I commonly use as well as set up
#       my environment
#   Usage: install.sh --pkg=<Package manager>
#
###############################################################################
set -e
SCRIPTDIR=$( cd "$( dirname "$0" )" && pwd )
DIR=${"$DIR"-"SCRIPTDIR"}
$DIR/header.sh "Wooo fresh install! Lets get started!"
PKG=eopkg
DOTBASH=""

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    DOTBASH=".bashrc"
    $DIR/install_linux.sh $PKG
elif [[ "$OSTYPE" == "darwin"* ]]; then
    DOTBASH=".bash_profile"
    $DIR/install_mac.sh
fi

POWERLINE_LOC="$HOME/.config/powerline-shell"
if [! -d "$POWERLINE_LOC" ]
    $DIR/header.sh "Installing Powershell"
    pip install powerline-shell
    mkdir -p $POWERLINE_LOC
    ln powerline.json $POWERLINE_LOC/config.json
fi

if [! -d "$HOME/.nvm" ];
    $DIR/header.sh "Installing NVM"
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

VUNDLE_LOC=$HOME/.vim/bundle/Vundle.vim
if [! -d "$VUNDLE_LOC" ];
    $DIR/header.sh "Installing Vundle!"
    git clone https://github.com/VundleVim/Vundle.vim
    vim +PluginInstall +qall
fi
ln $DIR/.vimrc $HOME/.vimrc

source $HOME/$DOTBASH
