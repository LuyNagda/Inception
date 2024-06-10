FROM debian:oldstable

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN apt-get update && apt-get install && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY ./tools/create_user.sh /create_user.sh

#CMD service mariadb start && ./create_user.sh && mysqld_safe

RUN service mariadb start && \
    mysql -u root -e "CREATE DATABASE ${DB_NAME}; \
    CREATE USER ${DB_USER}@'localhost' IDENTIFIED BY '${DB_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'localhost'; \
    FLUSH PRIVILEGES; \
    ALTER USER root@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" && \
    mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown

CMD	["mysqld_safe"]