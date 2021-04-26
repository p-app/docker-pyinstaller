FROM i386/python:3.9-slim

ARG PYINSTALLER_VERSION=4.3

ENV PYPI_URL=https://pypi.org/
ENV PYPI_INDEX_URL=https://pypi.org/simple

COPY entrypoint.sh /entrypoint.sh

RUN \
    set -x \
    # update system
    && apt-get update \
    && apt-get install --no-install-recommends -y binutils libc-bin upx \
    && pip install --upgrade pip wheel setuptools \
    # install pyinstaller
    && pip install pyinstaller==$PYINSTALLER_VERSION \
    && mkdir /src/ \
    && chmod +x /entrypoint.sh

VOLUME /src/
WORKDIR /src/

ENTRYPOINT ["/entrypoint.sh"]
