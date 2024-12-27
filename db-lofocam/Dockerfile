# Use an official MySQL image as base
FROM mysql:8.0

# Set MySQL environment variables
ENV MYSQL_DATABASE=lofocam

# Copy the initial SQL script to the Docker container
COPY lofocam.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306
