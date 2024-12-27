# Use an official PHP image as base
FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite and set ServerName
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy application source code to the web server directory
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Change ownership of the files to Apache user
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80 for the web server
EXPOSE 80
