#!/bin/bash
mkdir -p  ~/.ssh/
cp $KEY_PATH ~/.ssh/id_rsa
chmod -R 0400 ~/.ssh/
ssh-keyscan -p 722 $GIT_HOST >> ~/.ssh/known_hosts
cd ${GIT_BASE_PATH}
chmod +x /sync-repo.sh
crontab -l | { cat; echo "*/5	*	*	*	*	/sync-repo.sh > /var/log/sync.log 2>&1"; } | crontab -
touch /var/log/sync.log
crond -d 0 && tail -f /var/log/sync.log
