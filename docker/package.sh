#!/bin/bash

ARTIFACT_DIR=vim-artifact

# Package vim-artifact
mkdir -p $ARTIFACT_DIR
cp ../vimrc-docker  ./$ARTIFACT_DIR/vimrc-docker
cp -r ../colors     ./$ARTIFACT_DIR/colors
cp -r ../fonts      ./$ARTIFACT_DIR/fonts
cp -r ../syntax     ./$ARTIFACT_DIR/syntax
cp -r ../bundle     ./$ARTIFACT_DIR/bundle
