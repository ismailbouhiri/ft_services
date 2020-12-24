FROM alpine:latest

RUN apk update && apk add mysql mysql-client openrc
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN rc-service mariadb start && mysqladmin -u root password toor
CMD [ "sh" ]