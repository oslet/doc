#!/bin/bash

cur_d=`date +%d`
sar -n DEV -f /var/log/sa/sa$cur_d |awk '/^[^a-z]/ {print  $1,$3,$6,$7}'
