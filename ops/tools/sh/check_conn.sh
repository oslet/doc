#!/bin/bash

count=`/usr/sbin/ss -ant | grep ESTAB | wc -l`
logfile=/tmp/check_conn.log

if [ "$count" -gt 10000 ]; then
echo `date +%Y%m%d_%H%M%S` >> $logfile
echo "The tcp count : $count" >> $logfile
echo "socket count is more than 10000, The python PID will be restart" >> $logfile
/etc/init.d/pms stop
sleep 2
count_proc=`pgrep python | wc -l`
if [ $count_proc -ne 0 ]; then
pkill -9 python
fi
sleep 2
/etc/init.d/nginx stop
count_nginx=`pgrep nginx | wc -l`
if [ $count_nginx -ne 0 ]; then
pkill -9 nginx
fi
else
exit
fi

sleep 15


python_proc=`pgrep python | wc -l`
nginx_proc=`pgrep nginx | wc -l`

if [ $python_proc -eq 0 ]; then
/etc/init.d/pms start
fi

if [ $nginx_proc -eq 0 ]; then
/etc/init.d/nginx start
fi

