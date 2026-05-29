FROM php:8.4-fpm-alpine

ARG UID=1000
ARG GID=1000

RUN apk add --no-cache \
        $PHPIZE_DEPS \
        bash \
        curl \
        freetype-dev \
        git \
        icu-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        linux-headers \
        mysql-client \
        oniguruma-dev \
        unzip \
        zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        exif \
        gd \
        intl \
        opcache \
        pcntl \
        pdo_mysql \
        zip \
    && pecl install redis \
    && docker-php-ext-enable redis

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN addgroup -g ${GID} -S laravel \
    && adduser -u ${UID} -S laravel -G laravel

WORKDIR /var/www/html

COPY docker/php/php.ini /usr/local/etc/php/conf.d/99-laravel.ini
COPY docker/php/entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint \
    && chown -R laravel:laravel /var/www/html

USER laravel

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]
