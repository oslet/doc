#!/bin/bash
cat /proc/cpuinfo | grep "physical id"|sort|uniq
if [ "$?" == "1" ]; then
echo "VM"
fi
cat /proc/cpuinfo | grep "model name" |sort|uniq|awk -F ":" '{print $2}'
expr `cat /proc/meminfo | grep MemTotal | awk -F ":" '{print $2}' |awk '{print $1}'` / 1024
