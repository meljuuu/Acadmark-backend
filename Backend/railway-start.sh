#!/bin/bash

# Generate application key if not set
php artisan key:generate --force

# Run migrations
php artisan migrate --force

# Clear and cache configuration
php artisan config:clear
php artisan config:cache

# Clear and cache routes
php artisan route:clear
php artisan route:cache

# Start the application using the PORT environment variable
php artisan serve --host=0.0.0.0 --port=${PORT:-8000} 