#!/usr/bin/env bash

CRON_JOB_COMMAND=${CRON_JOB_COMMAND:-"echo Hello World!"}

if [[ ${CRON_JOB_COMMAND_STOPPED} == true ]]; then
    echo "Cron job has been stopped, skipping..."
    exit 0
fi

eval "${CRON_JOB_COMMAND}"

if [[ $? -eq -1 ]]; then
    export CRON_JOB_COMMAND_STOPPED=true
fi
