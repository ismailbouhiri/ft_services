openrc
touch /run/openrc/softlevel
rc-status
rc-service telegraf start
rc-service sshd start
nginx -g 'daemon off;'