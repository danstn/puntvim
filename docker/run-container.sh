#!/bin/bash

docker run \
  --interactive --tty --rm \
  --volume "$HOME:/home/vimmer/mnt" \
  dzotokan/vim $@

