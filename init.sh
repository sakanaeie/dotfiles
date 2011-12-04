#!/bin/sh

MAKE_LINK_LIST="
.vim
.vimrc
"

cd $(dirname $0)
for dotfile in $MAKE_LINK_LIST
do
	ln -Fis "$PWD/$dotfile" $HOME
done

mkdir .vim/swap
mkdir .vim/bundle

git submodule init
git submodule update
