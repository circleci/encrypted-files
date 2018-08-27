#!/usr/bin/env bash

openssl aes-256-cbc -d -md sha256 \
    -in env.cipher \
    -pass env:OPENSSL_PASSWORD \
    >> $BASH_ENV
