#!/usr/bin/env bash

openssl aes-256-cbc -d -in secret-env-cipher -out secret-env-plain -k $OPENSSL_KEY
source secret-env-plain
rm secret-env-plain
