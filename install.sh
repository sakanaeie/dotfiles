#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

MAKE_LINK_LIST="
.vim
.vimrc
.zshrc
.vscode
"

for dotfile in $MAKE_LINK_LIST; do
  ln -sfn "$SCRIPT_DIR/$dotfile" "$HOME/$dotfile"
done

VSCODE_REMOTE_DIR="$HOME/.vscode-remote/data/Machine"
[ ! -d "$VSCODE_REMOTE_DIR" ] && VSCODE_REMOTE_DIR="$HOME/.vscode-server/data/Machine"

if [ -d "$VSCODE_REMOTE_DIR" ]; then
  if [ ! -e "$VSCODE_REMOTE_DIR/.vscode" ] && [ ! -L "$VSCODE_REMOTE_DIR/.vscode" ]; then
    ln -s "$SCRIPT_DIR/.vscode" "$VSCODE_REMOTE_DIR/.vscode"
  fi
fi

mkdir -p "$SCRIPT_DIR/.vim/swap"

git config --global alias.co checkout
