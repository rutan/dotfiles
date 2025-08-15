#!/bin/bash

dotfiles_path=`cd $(dirname $0) && pwd`

# link
ln -s ${dotfiles_path}/.gitignore ~/.gitignore
ln -s ${dotfiles_path}/.gitconfig ~/.gitconfig
ln -s ${dotfiles_path}/.tmux.conf ~/.tmux.conf
ln -s ${dotfiles_path}/.vimrc ~/.vimrc
ln -s ${dotfiles_path}/.zshrc ~/.zshrc

