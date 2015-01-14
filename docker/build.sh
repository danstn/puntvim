#!/bin/bash

# Package artifacts
./package.sh

# Bake a container
CONTAINER_TAG="dzotokan/vim"
docker build -t $CONTAINER_TAG .
docker images $CONTAINER_TAG

# Post build cleanup
./clean.sh
