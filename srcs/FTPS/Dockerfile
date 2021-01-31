FROM alpine:3.12

ENV ip=192.168.99.103

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories 

RUN apk update \
&& apk add pure-ftpd \
&& adduser -D ibouhiri \
&& echo ibouhiri:ibouhiri | chpasswd \
&& mkdir -p ftps/ibouhiri 
RUN apk add openrc telegraf && openrc && touch /run/openrc/softlevel

COPY pure-ftpd.pem /etc/ssl/private/
COPY telegraf.conf /etc/.

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY Scripts.sh /
COPY CheckSrvs.sh /

EXPOSE 21 21000

ENTRYPOINT [ "sh", "Scripts.sh" ]