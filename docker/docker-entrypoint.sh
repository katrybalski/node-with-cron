#!/usr/bin/env bash

set -e

DIR=$( dirname $0 )

${DIR}/setup.sh

exec "$@"
