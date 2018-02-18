#!/bin/bash
set -e

mkdir /app/repo/
git clone ${GIT_URL} /app/repo
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"

if [ "${GIT_URL}" == "**None**" ]; then
    echo "=> Please Set GIT_URL GIT_EMAIL GIT_NAME"
	exit
fi

if [ "${PRIVATE_KEY}" != "**None**" ]; then
    echo "=> Found private key"
	
    mkdir -p ~/.ssh
    chmod 700 ~t/.ssh
	
    touch ~/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
    echo ${PRIVATE_KEY} > /root/.ssh/id_rsa
fi

service crond start
echo -e "\n${CRON_TIME} root /app/push.sh\n" >> /etc/crontab
service crond reload

echo "push for test"
/app/push.sh