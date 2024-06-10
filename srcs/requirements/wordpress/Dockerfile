FROM debian:oldstable

EXPOSE 9000

# Install dependencies
RUN apt update && apt install -y wget gnupg2 lsb-release apt-transport-https

# Add PHP repository
RUN wget https://packages.sury.org/php/apt.gpg && apt-key add apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# Install PHP and required extensions
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget \
    php-fpm \
	php-mysql \
	mariadb-client \
	curl && \
    rm -rf /var/lib/apt/lists/*

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php/8.3/fpm/pool.d/www.conf

# Download and extract WordPress
#ADD https://wordpress.org/latest.tar.gz /var/www/html/latest.tar.gz
#RUN cd /var/www/html && tar -xvf latest.tar.gz && rm -rf latest.tar.gz

# Install WP-CLI
#RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp --silent
#RUN chmod +x /usr/local/bin/wp
RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp


# Copy WordPress configuration and startup script
COPY ./conf/config.sh /var/config.sh

# Set the startup command
CMD ["bash", "/var/config.sh"]