#!/bin/bash
#filename chk_memory.sh
#edit by www.jbxue.com
echo -n "PidName   " > /tmp/pid.f
echo    "MeMery    " >> /tmp/pid.f
PIDPATH=/proc/
TOTLE=0
cd $PIDPATH
DOC=`ls`
  for DOCNAME in $DOC
    do
       if [ -d $DOCNAME ]; then
         cd $DOCNAME
            if [ -f status ];then
              MEMERY=`grep VmRSS status | awk -F':' '{print $2}' | awk '{print $1}'`
              PIDNAME=`grep Name status | awk -F':' '{print $2}'`
              if [ $MEMERY ]; then
                echo -n $PIDNAME >> /tmp/pid.f
                echo -n "   "    >> /tmp/pid.f
                echo    $MEMERY  >> /tmp/pid.f
                TOTLE=`expr $TOTLE + $MEMERY`
                cd ..
               else
                cd ..
              fi
              else
               cd ..
            fi
       fi
  done
TOTLE=`expr $TOTLE / 1024`
echo "TOTLE USERD: $TOTLE MB" >> /tmp/pid.f
cat  /tmp/pid.f
