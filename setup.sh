minikube delete
minikube start --driver=virtualbox
minikube addons enable dashboard 
eval $(minikube -p minikube docker-env)

# -------------------------- Install Volumes ---------------------------

minikube ssh 'sudo mkdir /mnt/data; sudo mkdir /mnt/data/ftp; sudo chmod 777 /mnt/data/ '
#minikube ssh 'sudo mkdir /mnt/data; sudo chmod 777 /mnt/data/ '
kubectl apply -f srcs/Mysql/db-pv.yml
kubectl apply -f srcs/Mysql/db-pvc.yml

# ----------------------------------------------------------------------

docker build -t my-ftps ./srcs/FTPS/ # build image ftps
docker build -t my-nginx ./srcs/Nginx/ # build image nginx
docker build -t my-wordpress ./srcs/Wordpress/ # build image wordpress
docker build -t my-phpmyadmin ./srcs/phpmyadmin/ # build image phpmyadmin
docker build -t my-mysql ./srcs/Mysql/ # build image mysql

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
kubectl apply -f srcs/Mysql/mysql.yml

ssh-keygen -R 192.168.99.103
minikube dashboard &