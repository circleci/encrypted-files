#!/usr/bin/env bash

git clone https://github.com/libressl-portable/portable.git libressl
cd libressl && sh autogen.sh
./configure --prefix="${HOME}/opt/libressl"
make
sudo make install
echo '/opt/libressl' | sudo tee /etc/ld.so.conf.d/libressl.conf
sudo ldconfig
cd ..

openssl aes-256-cbc -d -in secret-env-cipher -out secret-env-plain -k ${OPENSSL_KEY}
source secret-env-plain
#rm secret-env-plain

echo "FOO: ${FOO} BAR: ${BAR}"
echo $(openssl version)
