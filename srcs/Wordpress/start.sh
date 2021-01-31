openrc
touch /run/openrc/softlevel
rc-status
rc-service telegraf start
rc-service -v php-fpm7 start
nginx -g 'daemon off;'