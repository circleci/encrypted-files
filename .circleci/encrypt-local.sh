#!/usr/bin/env bash

openssl aes-256-cbc -e -md sha256 \
    -in  env.plain \
    -out env.cipher \
    -pass env:CIRCLE_OPEN_SSL_PASSWORD
