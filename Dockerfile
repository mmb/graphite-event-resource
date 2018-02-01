FROM alpine:3.7

RUN apk add --no-cache \
  curl=7.57.0-r0 \
  jq=1.5-r4

COPY resource /opt/resource
