#!/bin/sh

set -e

touch "$PWD/docker/.data/.packages"

exec docker run --name ttapi --rm -it \
  -v "$PWD:/src" -w '/src' \
  -v "$PWD/docker/.data/.dart_tool:/src/.dart_tool" \
  -v "$PWD/docker/.data/.packages:/src/.packages" \
  -v "$PWD/docker/.data/.pub-cache:/root/.pub-cache" \
  google/dart bash
