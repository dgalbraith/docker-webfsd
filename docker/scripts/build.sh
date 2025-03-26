#!/bin/bash -eu

WEBFS_VERSION="1.21"
WEBFS_PORT="8080"
WEBFS_HOSTING_DIR="/srv"

docker build -t webfs:$WEBFS_VERSION -t webfs:latest \
             --build-arg WEBFS_VERSION=$WEBFS_VERSION \
             --build-arg WEBFS_PORT=$WEBFS_PORT \
             --build-arg WEBFS_HOSTING_DIR=$WEBFS_HOSTING_DIR