# Stage 1: Build the application
FROM php:8.3.0RC6-cli as builder

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy Laravel application files
COPY . .

# Install dependencies using composer
RUN composer install --no-dev --no-interaction --no-progress --no-suggest --ignore-platform-req=ext-http --ignore-platform-req=ext-xdebug
RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install mbstring
RUN docker-php-ext-install exif
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath
#RUN docker-php-ext-install gd

# Generate an optimized autoloader
RUN composer dump-autoload --optimize --classmap-authoritative

# # Generate the application key
# RUN php artisan key:generate

# Build the application
RUN php artisan config:cache
RUN php artisan route:cache
#RUN php artisan view:cache

# Stage 2: Create final image
FROM php:8.3.0RC6-cli

# Set working directory
WORKDIR /app

# Copy built application from the builder stage
COPY --from=builder /app .

# Expose the application port (if needed)
EXPOSE 8000

# Run the application
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=80"]