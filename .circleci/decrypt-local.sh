#!/usr/bin/env bash

openssl aes-256-cbc -d -md sha256 \
    -in  env.cipher \
    -out env.generated \
    -pass env:CIRCLE_OPEN_SSL_PASSWORD
