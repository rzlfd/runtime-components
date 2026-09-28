#!/bin/bash
# Install dotfiles by linking them into the home directory
DIR="$(cd "$(dirname "$0")" && pwd)"
for f in .bashrc .zshrc .vimrc .gdbinit .gitconfig; do
  if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then
    mv "$HOME/$f" "$HOME/$f.backup"
    echo "Backed up existing $f to $f.backup"
  fi
  ln -sf "$DIR/$f" "$HOME/$f"
  echo "Linked $f"
done
