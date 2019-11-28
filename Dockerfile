FROM ubuntu:18.04
MAINTAINER Robert Ressl <r.ressl@safematix.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y \
						software-properties-common
RUN add-apt-repository ppa:ondrej/php

RUN apt-get update \
	&& apt-get install -y \
                                                php7.3-fpm php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl php7.3-bcmath \
						nginx \
						curl \
						ffmpeg graphicsmagick \
						supervisor

RUN apt-get update \
	&& apt-get dist-upgrade -y

RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

COPY files/root /

VOLUME /etc/nginx
VOLUME /var/www

EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
