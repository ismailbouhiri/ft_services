FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
 && apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
 && apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
 && apk add php7-ctype php7-dom \
 && apk add php php-fpm nginx telegraf openrc && mkdir /run/nginx;

COPY ./telegraf.conf /etc/
COPY CheckSrvs.sh /

WORKDIR /var/www/localhost/htdocs

RUN wget http://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    rm latest.tar.gz && cd /

COPY wp-config.php /var/www/localhost/htdocs/wordpress

COPY default.conf /etc/nginx/conf.d
COPY start.sh .
# CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';", "exec rc-service telegraf start"]
ENTRYPOINT sh start.sh
