FROM alpine:latest

RUN apk update

RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
 && apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
 && apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
 && apk add php7-ctype php7-dom && apk add php php-fpm php-session php-mbstring \ 
 php-gettext nginx && mkdir /run/nginx;

COPY pma.sh .

RUN sh pma.sh

COPY config.inc.php /usr/share/webapps/phpmyadmin

EXPOSE 5000

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]

ENTRYPOINT php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin
#php -S 0.0.0.0:5000 -t /usr/share/webapps/phpmyadmin