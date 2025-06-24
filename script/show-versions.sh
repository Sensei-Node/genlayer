#!/bin/bash

curl -s "https://storage.googleapis.com/storage/v1/b/gh-af/o?prefix=genlayer-node/bin/amd64" \
| grep -o '"name": *"[^"]*"' \
| sed -n 's/.*\/\(v[0-9]\+\.[0-9]\+\.[0-9]\+\(-[a-zA-Z0-9]\+\)\?\)\/.*/\1/p' \
| sort -u
