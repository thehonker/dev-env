FROM docker.io/alpine:3

ARG DOCKER_USER=default_user

RUN set -exu \
  && apk add --no-cache \
    bash \
    cmake \
    g++ \
    gcc \
    make \
    nodejs \
    pipx \
    py3-pip \
    python3 \
    gosu

COPY entrypoint.sh /entrypoint.sh

WORKDIR /work

ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
