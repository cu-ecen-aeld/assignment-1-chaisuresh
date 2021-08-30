#!/bin/sh
# Author: Chaithra Suresh

WRITEDIR=$1
writestr=$2
#echo "hello"

len=${#WRITEDIR}
count=1
count2=1
keep=0
sym="/"
#echo ${WRITEDIR}

while [ $count -lt "$len" ]
do
	str=`expr substr $WRITEDIR $count $count2`
	#echo $str
	if [ "$str" = "$sym" ]
	then
		keep=$count		
	fi 
	count=$((count+1))
done	

if [ $# -lt 2 ]
then
	echo "please input two command line arguments"
	echo "first- path to create  second- text string to add"
	exit 1
fi

len2=`expr $count - $keep`
str2=`expr substr $WRITEDIR 1 $keep`


mkdir -p "${str2}"

cd $str2
tmp=`expr $keep + 1`
str3=`expr substr $WRITEDIR $tmp $count`
#echo $str2
#echo $str3

touch $str3
echo $writestr >> $str3
