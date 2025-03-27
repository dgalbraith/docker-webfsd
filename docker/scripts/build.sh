#!/bin/bash -eu

WEBFSD_VERSION="1.21"
WEBFSD_PORT="8080"
WEBFSD_HOSTING_DIR="/srv"

docker build -t webfsd:$WEBFSD_VERSION -t webfsd:latest \
             --build-arg WEBFSD_VERSION=$WEBFSD_VERSION \
             --build-arg WEBFSD_PORT=$WEBFSD_PORT \
             --build-arg WEBFSD_HOSTING_DIR=$WEBFSD_HOSTING_DIR .