#!/bin/bash

cd /var/www/html/pub

rsync -vai4CHP --safe-links --numeric-ids --delete --delete-delay --delay-updates rsync://mirrors.tuna.tsinghua.edu.cn/centos/6/os/x86_64/Packages centos/6/os/x86_64

rsync -vai4CHP --safe-links --numeric-ids --delete --delete-delay --delay-updates rsync://mirrors.tuna.tsinghua.edu.cn/centos/6/updates/x86_64/Packages centos/6/updates/x86_64

rsync -vai4CHP --safe-links --numeric-ids --delete --delete-delay --delay-updates rsync://rsync.us-msync.centos.org/epel/6/x86_64 epel/6
