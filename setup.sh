#!/bin/bash

# Get puntvim
https://github.com/dzotokan/puntvim.git ~/.vim

# Install Vundle for vim package management
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Link vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Install Vim plugins
vim +PluginInstall +qall
