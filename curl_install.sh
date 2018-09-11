#!/usr/bin/env bash

INSTALL_LOC=$HOME/dotfiles
if [[ "$OSTYPE" == "darwin"* ]]; then
    printf "\n\e[1;36m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\e[0m\n"
    printf "\e[1;36m┃ \e[1m%-77s\e[0m┃\e[0m\n" "Detected OSX: Installing Homebrew"
    printf "\e[1;36m┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\e[0m\n\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [! -d $INSTALL_LOC ];
    git clone https://github.com/radding/dotfiles $INSTALL_LOC
fi

export DIR=$INSTALL_LOC
$INSTALL_LOC/install.sh
