openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
cd /usr/share/webapps
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv /config.inc.php /usr/share/webapps/phpmyadmin
chmod -R 777 /usr/share/webapps/
ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
ln -s /usr/share/webapps/phpmyadmin/ /var/www/html/
cd /
chown -R www-data:www-data /usr/share/webapps/phpmyadmin/ /var/www/html
chmod -R a-x,a=rX,u+w /usr/share/webapps/phpmyadmin/ /var/www/html
openrc
touch /run/openrc/softlevel
rc-status
/etc/init.d/telegraf start
rc-service -v php-fpm7 start
nginx -g 'daemon off;'
# # ln -s /var/www/localhost/htdocs/phpmyadmin/ /var/www/html/
# # echo "<h1>Welcome To pma!</h1>" > /var/www/localhost/htdocs/phpmyadmin/index.html;