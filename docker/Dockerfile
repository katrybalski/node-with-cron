ARG BASE_IMAGE=node:15.14.0-buster

FROM $BASE_IMAGE

RUN apt-get update && apt-get -y install cron

WORKDIR /nodewithcron
COPY . .

ENTRYPOINT ["/nodewithcron/docker/docker-entrypoint.sh"]

CMD ["cron", "-f"]
