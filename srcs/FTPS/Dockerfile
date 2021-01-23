FROM alpine:3.12

ENV ip=192.168.99.103

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories 

RUN apk update \
&& apk add pure-ftpd \
&& adduser -D ibouhiri \
&& echo ibouhiri:ibouhiri | chpasswd \
&& mkdir -p ftps/ibouhiri 

COPY pure-ftpd.pem /etc/ssl/private/

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY Scripts.sh /

EXPOSE 21 21000

ENTRYPOINT [ "sh", "Scripts.sh" ]