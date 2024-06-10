FROM debian:bullseye

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/create_user.sh /usr/local/bin/create_user.sh

RUN chmod +x /usr/local/bin/create_user.sh

CMD service mariadb start && /usr/local/bin/create_user.sh && mysqld_safe