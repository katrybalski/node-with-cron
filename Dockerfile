FROM node:15.14.0-buster

RUN apt-get update && apt-get -y install cron

WORKDIR /nodewithcron
COPY docker-entrypoint.sh .
COPY scripts scripts

RUN ln -s /usr/local/bin/node /usr/bin/node

ENTRYPOINT ["/nodewithcron/docker-entrypoint.sh"]

CMD ["cron", "-f"]
