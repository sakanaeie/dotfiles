#!/bin/sh

MAKE_LINK_LIST="
.vim
.vimrc
.zshrc
"

cd $(dirname $0)
for dotfile in $MAKE_LINK_LIST
do
  ln -Fis "$PWD/$dotfile" $HOME
done

mkdir -p .vim/swap
mkdir -p .vim/bundle
mkdir -p .vim/ref

git submodule init
git submodule update
git config --global alias.co checkout
