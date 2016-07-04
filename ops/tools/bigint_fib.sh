#!/bin/bash

if [ $# -eq 1 ]
then
Num =$1
else
echo -n "Enter a Number :"
read Num
fi

f1=0
f2=1

echo "The fibonacci sequence for the number $Num is :"

for ((i=0;i<=Num;i++))
do
echo -n "$f1 "
fn=`echo $f1+$f2 | bc`
f1=$f2
f2=$fn
done

echo
