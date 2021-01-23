mkdir /run/openrc
touch /run/openrc/softlevel
rc-status
/etc/init.d/mariadb setup
rc-service mariadb start
mysql --user=root -e "CREATE DATABASE wordpress; use wordpress" 
mysql -u root -e "CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'Admin'@'%'; FLUSH PRIVILEGES;"
mysql -u root wordpress < /Users.sql
rc-update add mariadb default
sh usr/share/mariadb/mysql.server start
tail -f /dev/null