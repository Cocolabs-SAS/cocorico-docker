#!/bin/sh

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
fi

if [ ! -d /var/lib/mysql/cocorico ]; then
    mysql_install_db --user=root > /dev/null
    mysqld --user=root --bootstrap --verbose=0 < /init/database.sql
fi

exec /usr/bin/mysqld --user=root --console
