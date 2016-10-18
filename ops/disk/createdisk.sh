#!/bin/bash

fdisk /dev/xvdb <<EOF
o
n
e
1


n
l


t
5
8e
w
q
EOF


sleep 2
echo "read partition table"
partprobe
mkfs -t ext4 /dev/xvdb5
exit 0
