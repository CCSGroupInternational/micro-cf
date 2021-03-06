#!/bin/sh -eu

mkdir -p "${MCF_SSL_CONF_DIR}"

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
    -keyout ${MCF_SSL_CONF_DIR}/example.key \
    -out ${MCF_SSL_CONF_DIR}/example.crt \
    -subj /CN=example.com \
    -addext subjectAltName=DNS:*.example.com,DNS:*.example.net,IP:10.0.0.1

cat ${MCF_SSL_CONF_DIR}/example.crt \
    ${MCF_SSL_CONF_DIR}/example.key \
    > ${MCF_SSL_CONF_DIR}/example.pem