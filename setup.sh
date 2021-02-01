minikube delete
# minikube config set memory 6144
# minikube config set cpus 2
# minikube config set vm-driver virtualbox
minikube start --driver=virtualbox --memory=4096 --cpus=3
minikube addons enable dashboard 
eval $(minikube -p minikube docker-env)

# -------------------------- create a folder-database ---------------------------

minikube ssh 'sudo mkdir /mnt/mysql; sudo chmod 777 /mnt/mysql '
minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb '

# ----------------------------------------------------------------------

docker build -t my-ftps ./srcs/FTPS/ # build image ftps
docker build -t my-nginx ./srcs/Nginx/ # build image nginx
docker build -t my-wordpress ./srcs/Wordpress/ # build image wordpress
docker build -t my-phpmyadmin ./srcs/phpmyadmin/ # build image phpmyadmin
docker build -t my-influxdb ./srcs/influxDB/ # build image influxdb
docker build -t my-mysql ./srcs/Mysql/ # build image mysql
docker build -t my-grafana ./srcs/Grafana/ # build image grafana

# -------------------------- Install metallb ---------------------------

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# ----------------------------------------------------------------------

# Create all deploy

kubectl apply -f srcs/metallb.yml
kubectl apply -f srcs/Nginx/Nginx.yml
kubectl apply -f srcs/FTPS/ftp.yml
kubectl apply -f srcs/Wordpress/wordpress.yml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yml
kubectl apply -f srcs/influxDB/influxdb.yml
kubectl apply -f srcs/Mysql/mysql.yml
kubectl apply -f srcs/Grafana/grafana.yml

ssh-keygen -R 192.168.99.103 #ssh-keygen delete ip from known_hosts

minikube dashboard & #add dashboard to the browser