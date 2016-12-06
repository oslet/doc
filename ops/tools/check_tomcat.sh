#!/bin/bash


function checkalive(){

m_log=/tmp/check_tomcat.log

if [ $# -lt 3 ]; then
echo "Usage checkalive /usr/lavande-wx/apache-tomcat-7.0.33 127.0.0.1 9080 login"
exit
fi

code=`curl -s -o /dev/null -m 10 --connect-timeout 10 -w %{http_code} http://$2:$3/$4`

if [ $code == 200 ]; then
        echo "OK,$1 app running."
  else
        echo "`date '+%Y-%m-%d %H:%M:%S'` $check_path app is down,will be starting" >> $m_log
        $1/bin/shutdown.sh
        exist_pid=`ps -ef | grep -v grep | grep "$1" | awk '{print $2}'`
    if [ -z $exist_pid ]; then
        exit
      else
        kill -9 $exist_pid
    fi
        $1/bin/startup.sh
        echo "`date '+%Y-%m-%d %H:%M:%S'` $1 app is running now" >> $m_log
fi
}

checkalive /usr/wx/apache-tomcat-7.0.33 127.0.0.1 9080 login
checkalive /usr/wxcrm/apache-tomcat-7.0.33 127.0.0.1 9180 crm/login