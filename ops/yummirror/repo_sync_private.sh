#!/bin/bash

cd /var/www/html/pub

rsync -vai4CH --safe-links --numeric-ids --delete --delete-delay --delay-updates rsync://rsync.mirrors.ustc.edu.cn/centos/6/os/x86_64/Packages centos/6/os/x86_64

rsync -e 'ssh -p 22' -vai4CH --safe-links --numeric-ids --delete --delete-delay --delay-updates centos/6/updates/x86_64/ itdeployment@192.168.1.1:/var/www/html/pub/centos/6/updates/x86_64

rsync -vai4CH --safe-links --numeric-ids --delete --delete-delay --delay-updates rsync://rsync.mirrors.ustc.edu.cn/epel/6/x86_64 epel/6
