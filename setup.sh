minikube delete
minikube start
eval $(minikube -p minikube docker-env)
docker build -t my-nginx ./srcs/Nginx/
docker build -t my-wordpress ./srcs/Wordpress/ 
docker build -t my-mysql ./srcs/Mysql/ 
# -------------------------- Install metallb ---------------------------

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# -------------------------------------------------------------------------

kubectl apply -f srcs/metallb.yml
kubectl apply -f srcs/Nginx/Nginx.yml
kubectl apply -f srcs/Wordpress/wordpress.yml
kubectl apply -f srcs/Mysql/mysql.yml

# FROM alpine:latest

# WORKDIR /usr/share/webapps/ 
# # work directory  

# RUN wget http://wordpress.org/latest.tar.gz \
#  && tar -xzvf latest.tar.gz \
#  && rm latest.tar.gz && cd /
# # install wordpress in work directory

# RUN apk update && apk add php7-common php7-iconv php7-json php7-gd php7-curl \
#  && apk add php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#  && apk add php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
#  && apk add php7-ctype php7-dom \
#  && apk add php php-fpm nginx && mkdir /run/nginx/;
# #install php and nginx

# #COPY wp-config.php /usr/share/webapps/wordpress/
# #copy wp-config.php for database wordpress
# COPY default.conf /etc/nginx/conf.d
# # copy default.conf for nginx host
# CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
# #start php and nginx
# ENTRYPOINT php -S 0.0.0.0:5050 -t /usr/share/webapps/wordpress
