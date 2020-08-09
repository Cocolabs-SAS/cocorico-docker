#!/bin/sh

if [[ ! -d /run/nginx ]]; then
    mkdir -p /run/nginx
fi

nginx -g "daemon off;"
