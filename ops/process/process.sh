#!/bin/bash
function show_elapsed_time()
{
 user_hz=$(getconf CLK_TCK) #mostly it's 100 on x86/x86_64
 pid=$1
 jiffies=$(cat /proc/$pid/stat | cut -d" " -f22)
 sys_uptime=$(cat /proc/uptime | cut -d" " -f1)
 last_time=$(( ${sys_uptime%.*} - $jiffies/$user_hz ))
 echo "the process $pid lasts for $last_time seconds."
}

if [ $# -ge 1 ];then
 for pid in $@
 do
  show_elapsed_time $pid
 done
fi

while read pid
do
 show_elapsed_time $pid
done

