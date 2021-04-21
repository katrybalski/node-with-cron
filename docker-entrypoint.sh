#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

. ${DIR}/scripts/set-cron-expression.sh

echo "Running cron:"
cat /code/node-cron

exec "$@"
