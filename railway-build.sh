#!/bin/bash

# Download composer installer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# Install composer silently
php composer-setup.php --quiet

# Install PHP dependencies without dev packages and optimize
php composer.phar install --no-dev --optimize-autoloader

# Run migrations with logging
php artisan migrate --force 2>&1 | tee migrate.log

# Run seeding with logging
php artisan db:seed --force 2>&1 | tee seed.log
