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

echo -e "\n${CRON_TIME} root /push.sh\n" >> /etc/crontab

service cron start

echo "for test"
bash /push.sh

read -n1 -p "Press any key to continue..."
