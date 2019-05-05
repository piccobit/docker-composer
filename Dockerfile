FROM php:7.3.5-apache-stretch

ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

COPY install-composer.sh /usr/local/bin

RUN install-composer.sh && \
    mv composer.phar /usr/local/bin/composer && \
    apt update && \
    apt install -y --no-install-recommends \
        git \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev && \
    docker-php-ext-install -j$(nproc) iconv && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-configure zip && \
    docker-php-ext-install -j$(nproc) zip
