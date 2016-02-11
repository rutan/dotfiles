#!/bin/bash

dotfiles_path=`cd $(dirname $0) && pwd`

# neobundle
if test -e ~/.vim/bundle/neobundle.vim; then
    echo 'skip neobundle'
else
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# link
ln -s ${dotfiles_path}/.vim ~/.gitconfig
ln -s ${dotfiles_path}/.vim ~/.gitignore
ln -s ${dotfiles_path}/.vim ~/.tmux.conf
ln -s ${dotfiles_path}/.vim ~/.vimrc
ln -s ${dotfiles_path}/.vim ~/.zshrc

