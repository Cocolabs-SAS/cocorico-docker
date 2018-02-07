#!/bin/sh

usermod -u ${HOST_UID} cocorico
groupmod -g ${HOST_UID} cocorico
chown cocorico:cocorico -R /cocorico
chown cocorico:cocorico -R /home/cocorico

supervisord --configuration /etc/supervisord.conf
