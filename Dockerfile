FROM tutum/ubuntu:trusty

MAINTAINER aprikyblue <aprikyblue@gmail.com>

RUN apt-get update -y && apt-get install -y \
        git \
        && rm -rf /var/lib/apt/lists/*

ENV GIT_EMAIL default@default.com
ENV GIT_NAME pusher
ENV PRIVATE_KEY **None**

COPY push_entrypoint.sh /push_entrypoint.sh

RUN chmod +x /push_entrypoint.sh

COPY push.sh /push.sh

RUN chmod +x /push.sh

CMD /push_entrypoint.sh