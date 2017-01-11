#!/bin/bash

cur_d=`date +%d`
sar -r -f /var/log/sa/sa$cur_d |awk '/^[^a-z]/ {print  $1,$3,$4,$5,$6,$7,$8,$9,$10,$11}'
