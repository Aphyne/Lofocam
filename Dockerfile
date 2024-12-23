FROM php:8.0-apache

# Install necessary dependencies for PHP and GD
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql  # Install the necessary PHP extensions

# Enable Apache mod_rewrite (important for URL rewrites)
RUN a2enmod rewrite

# Set the Apache document root environment variable
ENV APACHE_DOCUMENT_ROOT /var/www/html

# Copy the source code (php files) from the host machine into the container
COPY ./php /var/www/html/

# Copy Apache config (000-default.conf) into the container to configure Apache
COPY ./config/000-default.conf /etc/apache2/sites-available/000-default.conf

# Set working directory to the document root
WORKDIR /var/www/html

# Expose port 80 for web traffic
EXPOSE 80

# Ensure the container runs Apache in the foreground
CMD ["apache2-foreground"]
