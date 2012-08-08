#!/bin/sh

echo "Usage: latti_find.sh keyword [path]"

echo "path: $2";
echo "keyword: $1";

path=".";
keyword=$1

if [ "$1" != "" ]; then
	keyword=$1;
else
	echo "Wrong parameters!"
	echo "keyword is emtpy! EXIT"
	exit 1;
fi

if [ "$2" != "" ]; then
	path=$2;
fi

arr=$(find "$path" -type f)
arr=($arr)
echo "File number: ${#arr[@]}"

for i in "${arr[@]}"
do
	# echo $i
	# grep -i "test -d xulrunner" $i
	#grep -i ".mozconfig" $i && echo "=====> "$i
	grep -i "$keyword" $i && echo "====> "$i
done
