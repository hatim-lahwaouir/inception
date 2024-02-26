#!/bin/sh

apk update
apk add nginx
apk add openssl

TLS_CONF_DIR=/TLS/

CRT_DIR=$TLS_CONF_DIR/CRT
PRIV_KEY_DIR=$TLS_CONF_DIR/PRIV_KEY
CSR_DIR=$TLS_CONF_DIR/CRS

PRIVKEY=private.key
CRS=crs.csr
CRT=crt.crt


mkdir -p $CRT_DIR $PRIV_KEY_DIR $CSR_DIR



# creating our private key
openssl genrsa -out  "${PRIV_KEY_DIR}/${PRIVKEY}" 2048

# creating  our CSR (Certificate signing request)
openssl req -key "${PRIV_KEY_DIR}/${PRIVKEY}" -new -out "${CRT_DIR}/${CRS}"


# create our signed certificate 
openssl x509 -signkey "${PRIV_KEY_DIR}/${PRIVKEY}" -in "${CSR_DIR}/${CRS}" -req -days 365 -out "${CRT_DIR}/${CRT}"

