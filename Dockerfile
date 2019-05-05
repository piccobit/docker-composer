FROM php:7.3.5-apache-stretch

COPY install-composer.sh /usr/bin

RUN install-composer.sh

RUN git clone -b master https://github.com/getgrav/grav.git /var/www/html

WORKDIR /var/www/html/grav

RUN composer install --no-dev -o

RUN bin/grav install
