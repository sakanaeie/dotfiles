#!/bin/sh

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

DEIN_PATH=$XDG_CACHE_HOME/dein

echo "\n[mkdir]\n"

mkdir -p $XDG_CONFIG_HOME
mkdir -p $DEIN_PATH
mkdir -p $PWD/.vim/swap

echo "\n[ln]\n"

ln -snfv $PWD/.vim $XDG_CONFIG_HOME/nvim
ln -snfv $PWD/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
ln -snfv $PWD/.zshrc $HOME

echo "\n[install - dein]\n"

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $DEIN_PATH/installer.sh
sh $DEIN_PATH/installer.sh $DEIN_PATH

echo "\n[message]please install python3\n"

git config --global alias.co checkout
