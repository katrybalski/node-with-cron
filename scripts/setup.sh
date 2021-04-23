#!/usr/bin/env bash

set -e

CRON_EXPRESSION=${CRON_EXPRESSION:-"*/5 * * * *"}
CRON_JOB_COMMAND=${CRON_JOB_COMMAND:-"echo Hello World!"}

touch /nodewithcron/.env
chmod 0644 /nodewithcron/.env
for var in \
    "CRON_EXPRESSION" \
    "CRON_JOB_COMMAND" \
    "YARN_VERSION" \
    "NODE_VERSION" \
    "PATH";
do
    echo "export ${var}=\"${!var}\"" >> /nodewithcron/.env
done

touch /nodewithcron/crontab
echo "${CRON_EXPRESSION} . /nodewithcron/.env; /nodewithcron/scripts/run-job.sh  >> /proc/1/fd/1 2>/proc/1/fd/2" > /nodewithcron/crontab
# an empty line is required for cron
echo >> /nodewithcron/crontab
chmod 0644 /nodewithcron/crontab
crontab /nodewithcron/crontab

echo "CRON configuration: [${CRON_EXPRESSION} ${CRON_JOB_COMMAND}]"
