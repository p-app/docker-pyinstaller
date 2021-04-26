#!/usr/bin/env bash

set -e

OS_FAMILY="$1"
OS_ARCH="$2"

if [ -z "${OS_FAMILY}" ]
then
  echo "You should define OS family as first argument."
  exit 1
fi

if [ -z "${OS_ARCH}" ]
then
  echo "You should define OS architecture as second argument."
  exit 1
fi


cd "$( dirname "${BASH_SOURCE[0]}" )" || exit

docker build \
  -f "${OS_FAMILY}/${OS_ARCH}/Dockerfile" \
  -t "p2app/pyinstaller-${OS_FAMILY}:${OS_ARCH}" \
  "${OS_FAMILY}"
