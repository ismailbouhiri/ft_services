FROM alpine:3.12

ENV DB_PATH="/var/lib/mysql"
ENV DB_ROOT_PASS="mariadb_root_password"
ENV DB_USER="mariadb_user"
ENV DB_PASS="mariadb_user_password"

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc telegraf && \
    mysql_install_db --user=mysql --datadir=${DB_PATH}

COPY mariadb-server.cnf /etc/my.cnf.d
COPY Users.sql .
COPY telegraf.conf /etc/.
COPY pma.sql .
COPY mysql.sh .
COPY CheckSrvs.sh /


VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

ENTRYPOINT sh mysql.sh