#!/usr/bin/env bash

set -e

CRON_EXPRESSION=${CRON_EXPRESSION:-"*/5 * * * *"}
CRON_JOB_COMMAND=${CRON_JOB_COMMAND:-"echo Hello World!"}

# without that cron process does not find CRON_JOB_COMMAND variable
echo "export CRON_JOB_COMMAND=\"${CRON_JOB_COMMAND}\"" >> /root/.profile

echo "${CRON_EXPRESSION} . /root/.profile; /nodewithcron/scripts/run-job.sh  >> /proc/1/fd/1 2>/proc/1/fd/2" > /nodewithcron/crontab
# an empty line is required for cron
echo >> /nodewithcron/crontab

chmod 0644 /nodewithcron/crontab

crontab /nodewithcron/crontab

echo "Running cron [${CRON_EXPRESSION} ${CRON_JOB_COMMAND}]"
