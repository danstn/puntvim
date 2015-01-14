#!/bin/bash

docker run \
  --interactive --tty --rm \
  --user $(id -u) \
  --env "HOME=$HOME" \
  --volume "$HOME:$HOME" -v "$PWD:$PWD" \
  --workdir "$PWD" \
  dzotokan/vim $@

