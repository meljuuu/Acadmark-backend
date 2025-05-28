#!/bin/bash

set -e  # Exit on error

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --quiet
php composer.phar install --no-dev --optimize-autoloader

echo "Running migrations..."
php artisan migrate --force 2>&1 | tee migrate.log

echo "Seeding database..."
php artisan db:seed --force 2>&1 | tee seed.log

echo "Starting Laravel server..."
php artisan serve --host=0.0.0.0 --port=$PORT