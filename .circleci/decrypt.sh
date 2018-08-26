#!/usr/bin/env bash

sudo apt-get install libressl

libressl aes-256-cbc -d -in secret-env-cipher -out secret-env-plain -k ${OPENSSL_KEY}
source secret-env-plain
#rm secret-env-plain

echo "FOO: ${FOO} BAR: ${BAR}"
echo $(openssl version)
