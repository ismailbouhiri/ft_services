FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add influxdb openrc telegraf

RUN openrc && touch /run/openrc/softlevel

COPY influxdb.sh .
COPY CheckSrvs.sh /
COPY telegraf.conf /etc/.

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

ENTRYPOINT sh influxdb.sh
