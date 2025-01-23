FROM webdevops/php-nginx:8.2-alpine
RUN ls ./dockerizer
COPY ./dockerizer/php.ini /opt/docker/etc/php/php.ini
COPY ./dockerizer/vhost.conf /opt/docker/etc/nginx/vhost.conf

COPY composer.json composer.lock /app/

RUN composer install --no-interaction --no-scripts --no-suggest
#RUN composer update cachethq/core

#RUN cp .env .env

#RUN php artisan key:generate
#RUN php artisan vendor:publish --tag=cache
#RUN php artisan migrate

COPY . /app
