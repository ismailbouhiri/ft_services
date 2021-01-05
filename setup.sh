minikube delete
minikube start
eval $(minikube -p minikube docker-env)
docker build -t my-nginx ./srcs/Nginx/
docker build -t my-wordpress ./srcs/Wordpress/ 
docker build -t my-phpmyadmin ./srcs/phpmyadmin/ 
docker build -t my-mysql ./srcs/Mysql/
# -------------------------- Install metallb ---------------------------

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# -------------------------------------------------------------------------

kubectl apply -f srcs/metallb.yml
kubectl apply -f srcs/Nginx/Nginx.yml
kubectl apply -f srcs/Wordpress/wordpress.yml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yml
kubectl apply -f srcs/Mysql/mysql.yml
