#!/bin/bash

source /etc/bashrc >/dev/null 2>&1

source /etc/profile >/dev/null 2>&1

LOG_FILE=`mktemp`



netstat -n|awk '/^tcp/ {++S[$NF]} END {for (a in S) print a,S[a]}' > ${LOG_FILE}



#Functions to return tcp connect status



established () {

     VALUE=$(awk '/ESTABLISHED/ {print $2}' ${LOG_FILE})

    [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

listen () {

     VALUE=$(awk '/LISTEN/ {print $2}'     ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

timewait () {

     VALUE=$(awk '/TIME_WAIT/   {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

timeclose () {

     VALUE=$(awk '/TIME_CLOSE/ {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

finwait1 () {

     VALUE=$(awk '/FIN_WAIT1/   {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}



finwait2 () {

     VALUE=$(awk '/FIN_WAIT2/   {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}



synsent () {

     VALUE=$(awk '/SYN_SENT/   {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

synrecv () {

     VALUE=$(awk '/SYN_RECV/   {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}

closewait () { 

     VALUE=$(awk '/CLOSE_WAIT/ {print $2}' ${LOG_FILE})

     [ "${VALUE}" != "" ] && echo ${VALUE}|| echo 0

}



# Run the requested function

case "$1" in

        established)

            established

            ;;

        listen)

            listen

            ;;

        timewait)

            timewait

            ;;

        timeclose)

            timeclose

        ;;

        finwait1)

            finwait1

            ;;

        finwait2)

            finwait2

            ;;

        synsent)

            synsent

            ;;

        synrecv)

            synrecv

            ;;

        closewait)

            closewait

            ;;

        *)

            echo "Usage: $0 { established|listen|timewait|timeclose|finwait1|finwait2|synsent|synrecv|closewait}"

            ;;

esac
