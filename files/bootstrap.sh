#!/bin/sh

if [[ ! -f composer.json ]]; then
    git clone --no-checkout https://github.com/Cocolabs-SAS/cocorico
    mv cocorico/.git .
    rmdir cocorico
    git reset --hard HEAD
fi

if [[ ! -f app/config/parameters.yml ]]; then
    cp /init/parameters.yml app/config/parameters.yml
fi

if [[ ! -d vendor ]]; then
    composer install --prefer-dist
fi

while !(mysqladmin -ucocorico -pcocorico ping &> /dev/null); do
    sleep 1
done

if [[ ! -f /var/lib/mysql/cocorico/db.opt ]]; then
    php bin/console doctrine:schema:update --force
    php bin/console doctrine:fixtures:load -n
fi

if [[ ! -d /data/db ]]; then
    php bin/console doctrine:mongodb:schema:create
fi

if [[ ! -f web/json/currencies.json ]]; then
    php bin/console cocorico:currency:update
fi

if [[ ! -d web/bundles ]]; then
    php bin/console assets:install --symlink
fi

if [[ ! -d web/css/compiled || ! -d web/js/compiled ]]; then
    php bin/console assetic:dump
fi

echo 'cocorico is alive'
