FROM php:8.1-alpine

RUN apt-get update && apt-get install -y composer

COPY . /var/www/html

WORKDIR /var/www/html

RUN composer install

EXPOSE 80

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]