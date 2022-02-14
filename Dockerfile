FROM centos:centos7

MAINTAINER pastral1024 <pastral1024@gmail.com>

RUN yum update -y && \
    yum install -y  \
    crontabs \
    git

ENV GIT_URL **None**
ENV GIT_EMAIL default@default.com
ENV GIT_NAME pusher
ENV PRIVATE_KEY **None**
ENV CRON_TIME 0 7 * * *

RUN mkdir /app/

COPY init.sh /app/init.sh
RUN chmod +x /app/init.sh

COPY push.sh /app/push.sh
RUN chmod +x /app/push.sh

ENTRYPOINT /app/init.sh