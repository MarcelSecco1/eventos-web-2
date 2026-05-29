#!/bin/sh
set -e

cd /var/www/html

mkdir -p \
    storage/framework/cache/data \
    storage/framework/sessions \
    storage/framework/testing \
    storage/framework/views \
    storage/logs \
    bootstrap/cache

if [ ! -f .env ] && [ -f .env.example ]; then
    cp .env.example .env
fi

if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --prefer-dist
fi

if [ -f artisan ] && [ -f .env ]; then
    if ! grep -q '^APP_KEY=base64:' .env; then
        php artisan key:generate --force
    fi

    php artisan config:clear >/dev/null 2>&1 || true
fi

exec "$@"
