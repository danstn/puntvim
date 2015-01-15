#!/bin/bash

ARTIFACT_DIR=vim-artifact

# Package vim-artifact
mkdir -p $ARTIFACT_DIR

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
bunzip2 vim-7.4.tar.bz2
tar -xvf vim-7.4.tar
cp -r vim74 ./$ARTIFACT_DIR/vim

cp ../vimrc-docker  ./$ARTIFACT_DIR/vimrc-docker
cp -r ../colors     ./$ARTIFACT_DIR/colors
cp -r ../fonts      ./$ARTIFACT_DIR/fonts
cp -r ../syntax     ./$ARTIFACT_DIR/syntax
cp -r ../bundle     ./$ARTIFACT_DIR/bundle

# @TODO: Fix this dirty hack re: ultisnips mapping bug
rm -rf ./$ARTIFACT_DIR/bundle/YouCompleteMe
rm -rf ./$ARTIFACT_DIR/bundle/ultisnips
rm -rf ./$ARTIFACT_DIR/bundle/neocomplete.vim
