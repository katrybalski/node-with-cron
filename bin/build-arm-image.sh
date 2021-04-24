#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

ARM_VERSION="arm64v8/node:15.14.0-buster"
IMAGE_NAME="node-with-cron:arm64v8"

docker build -t ${IMAGE_NAME} \
        -f ${DIR}/../docker/Dockerfile \
        --build-arg BASE_IMAGE=${ARM_VERSION} \
        ${DIR}/..
