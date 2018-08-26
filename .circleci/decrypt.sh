#!/usr/bin/env bash

openssl aes-256-cbc -d -in secret-env-cipher -out secret-env-plain -md md5 -pass env:OPENSSL_PASSWORD
source secret-env-plain
#rm secret-env-plain

echo "FOO: ${FOO} BAR: ${BAR}"
echo $(openssl version)
