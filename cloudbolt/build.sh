#!/bin/bash
version=$1
docker build \
        -c 1024 \
        --cpuset-cpus 0-3 \
        --force-rm \
        --no-cache \
        --build-arg VERSION=${version} .
