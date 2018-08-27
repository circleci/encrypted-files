#!/usr/bin/env bash

openssl aes-256-cbc -e \
    -in  env.plain \
    -out env.cipher -md sha256 \
    -pass env:OPENSSL_PASSWORD
