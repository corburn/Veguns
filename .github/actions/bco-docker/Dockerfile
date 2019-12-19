#FROM alpine:3.10
FROM python:3-alpine

# The error was: cwltool requires Node.js engine to evaluate and validate Javascript
@ expressions, but couldn't find it.  Tried nodejs, node, docker run node:slim
RUN apk add --no-cache \
  gcc \
  libxml2-dev \
  libxslt-dev \
  linux-headers \
  musl-dev \
  nodejs \
&& pip install cwlref-runner 

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
