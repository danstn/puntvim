#!/bin/bash

CONTAINER_TAG="dzotokan/vim"

docker build -t $CONTAINER_TAG .

docker images $CONTAINER_TAG
