FROM tutum/ubuntu:trusty

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update -y && \
    apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

ENV GIT_URL **None**
ENV GIT_EMAIL default@default.com
ENV GIT_NAME pusher
ENV PRIVATE_KEY **None**
ENV CRON_TIME 0 7 * * *

COPY init.sh /push_init.sh
RUN chmod +x /push_init.sh

COPY push.sh /push.sh
RUN chmod +x /push.sh

EXPOSE 22

ENTRYPOINT /push_init.sh