FROM alpine:3.7

RUN apk add --no-cache \
  curl \
  gettext=0.19.8.1-r1 \
  jq=1.5-r4

COPY resource /opt/resource
