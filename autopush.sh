#!/bin/bash
uname=$1
pwd=$2
origin=`git remote show origin | grep -o -P "(?<=Push  URL: )http(s?)://.*\..*\/.*\.git"`
http=`echo $origin | grep -o -P "http(s?)://"`
repo=`echo $origin | grep -o -P "(?<=:\/\/).*\..*\/.*\.git"`
origin=$http$uname:$pwd@$repo
if git push --repo "$origin"; then
	echo "Credentials okay"
else
	echo "Credentials not okay"
	exit 1
fi
while true
do
	echo "hello"
done
