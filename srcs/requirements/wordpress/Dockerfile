FROM debian:bullseye

EXPOSE 9000

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y wget \
    php-fpm \
	  php-mysql \
	  mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN chmod +x wp-cli-2.7.0.phar
RUN mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY ./conf/config.sh /var/config.sh

CMD ["bash", "/var/config.sh"]