#!/bin/sh

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
fi

if [ ! -d /var/lib/mysql/cocorico ]; then
    mysql_install_db --user=root
    mysqld --user=root --bootstrap < /init/database.sql
fi

mysqld --user=root --console
