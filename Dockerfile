FROM webdevops/php-nginx:8.2-alpine

COPY ./php.ini /opt/docker/etc/php/php.ini
COPY ./vhost.conf /opt/docker/etc/nginx/vhost.conf
COPY composer.json composer.lock /app/

RUN composer install --no-interaction --no-scripts --no-suggest --no-dev -o

RUN composer update cachethq/core

RUN cp .env .env

RUN php artisan key:generate
RUN php artisan vendor:publish --tag=cache
run php artisan migrate

COPY . /app
