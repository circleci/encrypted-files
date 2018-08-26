#!/usr/bin/env bash

openssl aes-256-cbc -e -in secret-env-plain -out secret-env-cipher -md sha256 \
    -pass env:OPENSSL_PASSWORD
