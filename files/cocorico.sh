#!/bin/sh

if [ ! -f composer.json ]; then
    git clone --no-checkout https://github.com/Cocolabs-SAS/cocorico
    mv cocorico/.git .
    rmdir cocorico
    git reset --hard HEAD
fi

if [ ! -f app/config/parameters.yml ]; then
    cp /init/parameters.yml app/config/parameters.yml
fi

if [ ! -d vendor ]; then
    composer install --prefer-dist
fi

while !(mysqladmin -u cocorico -pcocorico ping); do
    sleep 1
done

if [[ ! $(mysql -u cocorico -pcocorico -e "USE cocorico; SHOW TABLES LIKE 'user'") ]]; then
    php app/console doctrine:schema:update --force
    php app/console doctrine:fixtures:load -n
fi

if [ ! -f web/json/currencies.json ]; then
    php app/console cocorico:currency:update
fi

if [ ! -d web/css/compiled ]; then
    php app/console asset:dump
fi

if [ ! -d /data/db ]; then
    php app/console doctrine:mongodb:schema:create
fi

php app/console server:run 0.0.0.0:8000
