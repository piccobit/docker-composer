FROM php:7.3.5-apache-stretch

ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

COPY install-composer.sh /usr/local/bin

RUN install-composer.sh

RUN apt update

RUN apt install -y --no-install-recommends git
