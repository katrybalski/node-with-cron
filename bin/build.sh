#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

if [[ ${ARM} = true ]]; then
    . ${DIR}/../.env-arm
else
    . ${DIR}/../.env
fi

docker build -t ${IMAGE_NAME} \
        -f ${DIR}/../docker/Dockerfile \
        --build-arg BASE_IMAGE=${BASE_IMAGE} \
        ${DIR}/..
