FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add nginx
RUN mkdir /run/nginx/;
RUN apk add openssl openssh openrc telegraf;

COPY default.conf /etc/nginx/conf.d
COPY start.sh .
COPY CheckSrvs.sh /
RUN mkdir .ssh
RUN adduser -D ibouhiri -G root && \
    echo "ibouhiri:ibouhiri" | chpasswd
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt && \
    echo "<h1>Welcome To Nginx!</h1>" > /var/www/localhost/htdocs/index.html;

COPY authorized_keys .ssh/
COPY ./telegraf.conf /etc/

RUN chown -R ibouhiri:root /etc/ssh

EXPOSE 80 443 22

ENTRYPOINT sh start.sh