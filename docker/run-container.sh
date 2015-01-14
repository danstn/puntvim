#!/bin/bash

docker run \
  --interactive --tty --rm \
  --volume "$HOME:/home/vimmer/mnt" \
  --volume "$PWD:/mnt/$PWD" \
  -w "/mnt/$PWD" \
  dzotokan/vim $@

