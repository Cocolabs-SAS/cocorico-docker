#!/bin/sh

usermod -u ${HOST_UID} cocorico &> /dev/null
groupmod -g ${HOST_UID} cocorico &> /dev/null

chown cocorico:cocorico -R /cocorico &> /dev/null
chown cocorico:cocorico -R /home/cocorico &> /dev/null

supervisord -c /etc/supervisord.conf

sleep 5

tail -f /var/log/supervisor/bootstrap.log
