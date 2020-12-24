openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
echo "<h1>Welcome To Nginx!</h1>" > /var/www/localhost/htdocs/index.html;
echo "done nginx start"
nginx -g 'daemon off;'