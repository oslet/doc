#!/bin/bash

check_varlog(){
cd /var/log
find . -type f -mtime +3 |  grep -E [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} | xargs rm -rf
}

check_usrlog(){
cd /usr/local
find . -type f -mtime +3 |  grep -E [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} | xargs rm -rf
}

check_onlinewebapps(){
cd /online-webapps
find . -type f -mtime +3 |  grep -E [0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} | xargs rm -rf
}

check_varlog
check_usrlog
check_onlinewebapps
