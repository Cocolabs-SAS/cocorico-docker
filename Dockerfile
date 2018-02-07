FROM alpine:edge

ENV COMPOSER_HOME "/home/cocorico"
ENV HOST_UID 1000

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk --update add \
        curl \
        git \
        grep \
        imagemagick \
        mongodb \
        mysql \
        mysql-client \
        php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-gd \
        php7-iconv \
        php7-imagick \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mongodb \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-simplexml \
        php7-session \
        php7-soap \
        php7-sockets \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        shadow \
        supervisor \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo  \
    && groupadd cocorico && useradd -g cocorico --create-home cocorico \
    && rm -rf /var/cache/apk/*

ADD files /

WORKDIR /cocorico

ENTRYPOINT ["sh", "/entrypoint.sh"]
