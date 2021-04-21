#!/usr/bin/env bash

set -e

CRON_EXPRESSION=${CRON_EXPRESSION:-"*/5 * * * *"}

echo "${CRON_EXPRESSION} /code/scripts/run-job.sh  >> /proc/1/fd/1 2>/proc/1/fd/2" > /code/node-cron
echo >> /code/node-cron # an empty line is required

chmod 0644 /code/node-cron

crontab /code/node-cron
