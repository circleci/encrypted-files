#!/usr/bin/env bash

openssl aes-256-cbc -d -in secret-env-cipher -out secret-env-generated -md sha256 \
    -pass env:OPENSSL_PASSWORD

source secret-env-generated

rm secret-env-generated

echo "FOO: ${FOO} BAR: ${BAR}"
