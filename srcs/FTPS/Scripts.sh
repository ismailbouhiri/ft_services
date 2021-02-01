openrc
touch /run/openrc/softlevel
rc-status
/etc/init.d/telegraf start
chown -R ibouhiri:ibouhiri  /home/ibouhiri
/usr/sbin/pure-ftpd -p 21000:21005 -P $ip -Y 2