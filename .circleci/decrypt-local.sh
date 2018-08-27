#!/usr/bin/env bash

openssl aes-256-cbc -e \
    -in  env.cipher \
    -out env.generated -md sha256 \
    -pass env:OPENSSL_PASSWORD
