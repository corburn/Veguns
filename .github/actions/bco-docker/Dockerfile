#FROM alpine:3.10
FROM python:3-alpine

RUN apk add --no-cache \
  gcc \
  musl-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
&& pip install cwlref-runner 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
