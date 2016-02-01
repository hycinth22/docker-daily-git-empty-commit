FROM tutum/ubuntu:trusty

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update -y && \
    apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

ENV GIT_URL **None**
ENV GIT_EMAIL default@default.com
ENV GIT_NAME pusher
ENV PRIVATE_KEY **None**

COPY init.sh /push_init.sh
RUN chmod +x /push_init.sh

COPY push.sh /push.sh
RUN chmod +x /push.sh

EXPOSE 22

CMD /push_entrypoint.sh