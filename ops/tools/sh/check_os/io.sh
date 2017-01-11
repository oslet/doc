#!/bin/bash

cur_d=`date +%d`
sar -u -f /var/log/sa/sa$cur_d |awk '/^[^a-z]/ {print  $1,$4,$5,$6,$7,$8,$9}' |grep -v [a-z] |grep -v [A-Z]  
