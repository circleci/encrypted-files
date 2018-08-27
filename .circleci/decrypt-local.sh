#!/usr/bin/env bash

openssl aes-256-cbc -d \
    -in  env.cipher \
    -out env.generated -md sha256 \
    -pass env:CIRCLE_OPEN_SSL_PASSWORD
