#!/usr/bin/env bash

openssl aes-256-cbc -d -in secret-env-cipher -md sha256 \
    -pass env:OPENSSL_PASSWORD >> $BASH_ENV

echo "FOO: ${FOO} BAR: ${BAR}"
