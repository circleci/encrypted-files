#!/usr/bin/env bash

openssl aes-256-cbc -d -md sha256 \
    -in env.cipher \
    -pass env:CIRCLE_OPEN_SSL_PASSWORD \
    >> $BASH_ENV
