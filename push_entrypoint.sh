#!/bin/bash

set -e

git config --global user.email "$GIT_EMAIL"

git config --global user.name "$GIT_NAME"

git clone $GIT_URL /push

if [ "${PRIVATE_KEY}" != "**None**" ]; then
    echo "=> Found private key"
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    touch /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
    echo ${PRIVATE_KEY} >> /root/.ssh/id_rsa
fi

echo -e "\n0 7 * * * /push.sh\n" >> /etc/crontab

service cron restart

/entrypoint.sh