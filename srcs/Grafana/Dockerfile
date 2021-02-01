FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add grafana telegraf openrc
RUN openrc && touch /run/openrc/softlevel

COPY ./CheckSrvs.sh /
COPY ./grafana.ini /etc/
COPY ./start.sh /
COPY ./telegraf.conf /etc/

ENTRYPOINT sh start.sh
