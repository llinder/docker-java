#!/bin/sh -x
# Takes a minimal but full JDK image from azul/zulu-openjdk-debian
# Removes the JDK and keeps the full JRE
# Then squashes to minimize the image size
# The resulting images are expected to change rarely, if ever

set -eu

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 zulu_tag"
    echo "  version: the version output from building zulu-openjdk-alpine "
    exit 1
fi

ZULU_TAG="$1"

docker build --build-arg zulu_tag=${ZULU_TAG} -t "ghcr.io/openzipkin/java:${ZULU_TAG}" .

docker push "ghcr.io/openzipkin/java:${ZULU_TAG}"
