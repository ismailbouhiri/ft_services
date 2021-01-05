FROM alpine:latest
ENV DB_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="mariadb_root_password"
ENV DB_USER="mariadb_user"
ENV DB_PASS="mariadb_user_password"

RUN apk update && apk add mariadb mariadb-common mariadb-client openrc && \
    mysql_install_db --user=mysql --datadir=${DB_PATH}

COPY mariadb-server.cnf /etc/my.cnf.d

COPY mysql.sh .

RUN sh mysql.sh

# VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

CMD ["mysqld_safe"]
