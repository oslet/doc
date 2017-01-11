#!/bin/bash

cur_d=`date +%d`
sar -q -f /var/log/sa/sa$cur_d |awk '/^[^a-z]/ {print  $1,$5,$6,$7}' |grep -v [a-z] |grep -v [A-Z]  
