#!/bin/bash

if [ -z $1 ]; then
echo "Usage $0 port"
exit
fi

/usr/sbin/ss -ant | grep EST | awk '/:'$1'/{split($5,ip,":");++A[ip[1]]}END{for(i in A) print A[i],i}' |sort -rn|head -20

if [ -z $2 ]; then
exit
else
netstat -n|awk '/^tcp/ {++S[$NF]} END {for (a in S) print a,S[a]}'
fi
