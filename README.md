# ft_services
Make a kubernetes cluster that will make sure your wordpress installation conforms to High Availability by means of services.

# Description
You will discover cluster deployment and management with Kubernetes. You are going to do what is called "clustering". The project consists of implementing an infrastructure with different services. For this, we will use Kubernetes, therefore, we will install a cluster that groups several service containers. Each service works in a dedicated container, and the containers have the same name as the associated service. For performance reasons the containers are built on Alpine Linux. To complete the project we need the next components:

# Components
Nginx: Is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

pure-ftpd: Is an FTP server for Unix-like system, including Linux.

MariaDB: Is a database management system derived from MySQL with a GPL (General Public License).

Wordpress: Is a CMS(Content Managament System) focused on the creation of any type of web page.

phpMyAdmin: Is a free software tool intended to handle the administration of MySQL over the web.

InfluxDB: Is a open-source time series database developed by InfluxData

Telegraf: Is the open-source server agent to help you collect metrics from your stacks, sensors and systems.

Grafana: Is a open-source graphing and analisys software. Allows you to query, view, alert, and explore your metrics from Time Series Database Storage(TSDB)

#Technologies
Docker: Is a open-source project that automates the deployment of applications within software containers.

Kubernetes: Is an open-source system for automating the deployment, scaling, and handling of containerized applications.

Minikube: Is a tool that lets you run kubernetes locally. minikube runs a single-node kubernetes cluster on your personal computer.

Alpine Linux: Is a Linux distribution based on musl and BusyBox, which aims to be lightweigth and secure by default.

#Technical considerations
Set up a multi-service cluster that includes Nginx, Wordpress, PhpMyAdmin, MySQL, Grafana, InfluxDB and FTPS. Each service runs in a dedicated container.

Dockerfile of each service needs to be custom built.

Wordpress have includes multiple users and an administrator.

In the event of a crash or if one of the two database containers is stopped, we ensure that the latter persist and are not lost. In case of deletion, the volumes where the data is stored persist.

In the event of a crash or stoppage of a container component, the containers restart automatically.

Nginx on Port 80(http), 443(https), and 22(ssh)

FTP on port 21

Wordpress on port 5050

PhpMyAdmin on port 5000

MySQL on port 3306

Grafana on port 3000

Influxdb on port 8086

# Installation
Update System and Install Required Packages : Docker , Minikube and Kubectl
