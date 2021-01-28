FROM alpine:3.12

RUN apk update

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    && apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    && apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    && apk add php7-ctype php7-dom && apk add php php-fpm php-session php-mbstring \ 
    php-gettext nginx openssl openrc && mkdir /run/nginx;

COPY default.conf /etc/nginx/conf.d/

COPY pma.sh .

COPY config.inc.php .

RUN mkdir -p /usr/share/webapps/

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# RUN chown -R www-data:www-data /usr/share/webapps/*

# RUN chmod -R 0755 /usr/share/webapps/*

EXPOSE 5000

ENTRYPOINT sh pma.sh

#  CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]

# ENTRYPOINT php -S 0.0.0.0:5000 -t /var/www/localhost/htdocs/phpmyadmin/