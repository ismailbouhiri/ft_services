FROM alpine:3.12
RUN apk update
RUN apk add nginx
RUN mkdir /run/nginx/;
RUN apk add openssl openssh openrc;
COPY default.conf /etc/nginx/conf.d
COPY NginxStart.sh .
EXPOSE 80 443 22
CMD ["sh", "NginxStart.sh"]