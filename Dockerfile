FROM docker.io/alpine:3

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
    python3

RUN set -exu \
  && addgroup \
    --gid 1000 \
    user \
  && adduser \
    --uid 1000 \
    --ingroup user \
    --disabled-password \
    --gecos user \
    user \
  && mkdir -pv /work \
  && chown 501:20 /work

USER user

WORKDIR /work

ENTRYPOINT ["/bin/bash"]
CMD ["--login"]
