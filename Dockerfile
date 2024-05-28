FROM php:8.1-alpine

RUN apk update 
RUN apk upgrade
RUN apk add --no-cache bash

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

# INSTALL COMPOSER
RUN curl -s https://getcomposer.org/installer | php
RUN alias composer='php composer.phar'

# INSTALL NGINX
RUN apk add nginx

WORKDIR /var/www/html

COPY . .

RUN composer install

EXPOSE 80

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]