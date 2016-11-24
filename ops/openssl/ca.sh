#!/bin/bash

CATOP=./demoCA
CAKEY=${CATOP}/private/cakey.pem
CAREQ=${CATOP}/careq.pem
CACERT=${CATOP}/cacert.pem

SSLCNF="-config ./openssl.cnf"

function newca()
{
    if [ ! -d ${CATOP} ] ; then
        mkdir -p ${CATOP}
        mkdir -p ${CATOP}/private
        mkdir -p ${CATOP}/newcerts
        touch ${CATOP}/index.txt
        echo "unique_subject = yes" > ${CATOP}/index.txt.attr
        echo "01" > ${CATOP}/crlnumber
    fi

    # create ca private key & certificate request
    openssl req ${SSLCNF} -new -nodes -keyout ${CAKEY} -out ${CAREQ}

    # creat ca certificate by self-signed
    openssl ca ${SSLCNF} -keyfile ${CAKEY} \
        -selfsign -create_serial           \
        -extensions v3_ca_cert             \
        -days 7305 -batch                  \
        -out ${CACERT}                     \
        -outdir ${CATOP}/newcerts          \
        -infiles ${CATOP}/careq.pem
}

function mkcert()
{
    # create a private key certificate request
    openssl req ${SSLCNF} -new -nodes -keyout newkey.pem -out newreq.pem

    # sign the certficate request
    openssl ca ${SSLCNF} -policy policy_cert -batch \
        -extensions www_cert -notext                \
        -out newcert.pem -infiles newreq.pem
}

function verify_cert()
{
    openssl verify -CAfile ${CACERT} newcert.pem
}

function revoke_cert()
{
    openssl ca ${SSLCNF} -revoke newcert.pem
    openssl ca ${SSLCNF} -gencrl -out ${CATOP}/crl.pem
}

newca

mkcert

verify_cert

#revoke_cert
