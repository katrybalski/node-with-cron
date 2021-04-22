FROM node:15.14.0-buster

RUN apt-get update && apt-get -y install cron

WORKDIR /nodewithcron
COPY docker-entrypoint.sh .
COPY scripts scripts

ENTRYPOINT ["/nodewithcron/docker-entrypoint.sh"]

CMD ["cron", "-f"]
