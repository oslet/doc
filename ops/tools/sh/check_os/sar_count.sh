#!/bin/bash

if [ -z $1 ]; then
echo "Usage: $0 date"
exit
fi

client=`hostname`
sarlog=/tmp/sarlog
if [ ! -d "$sarlog" ]; then
mkdir -p $sarlog
fi

cd $sarlog
sar -r -f /var/log/sa/sa$1 > mem_$1_$client.csv
sar -n DEV -f /var/log/sa/sa$1 > net_$1_$client.csv
sar -b -f /var/log/sa/sa$1 > disk_$1_$client.csv
sar -u -f /var/log/sa/sa$1 > cpu_$1_$client.csv
