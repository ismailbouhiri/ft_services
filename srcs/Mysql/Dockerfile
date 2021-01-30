FROM alpine:3.12

ENV DB_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="mariadb_root_password"
ENV DB_USER="mariadb_user"
ENV DB_PASS="mariadb_user_password"

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client openrc && \
    mysql_install_db --user=mysql --datadir=${DB_PATH}

COPY mariadb-server.cnf /etc/my.cnf.d

COPY Users.sql .

COPY pma.sql .

COPY mysql.sh .

VOLUME [ "/var/lib/mysql" ]

# RUN sh mysql.sh

EXPOSE 3306

# CMD ["mysqld_safe"]
ENTRYPOINT sh mysql.sh