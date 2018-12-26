FROM alpine:edge

ENV AWS_DEFAULT_REGION ap-northeast-1

RUN sed -i "s|/v[0-9]*.[0-9]*/|/edge/|g" /etc/apk/repositories\
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories\
 && apk upgrade --no-cache musl\
 && apk add --no-cache aws-cli py-boto3 ca-certificates
RUN apk add --no-cache openssl perl

WORKDIR /mnt
