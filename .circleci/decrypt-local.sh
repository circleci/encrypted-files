#!/usr/bin/env bash

openssl aes-256-cbc -d \
    -in  env.cipher \
    -out env.generated -md sha256 \
    -pass env:OPENSSL_PASSWORD
