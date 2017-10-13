#!/bin/bash
origin=`git remote show origin | grep -o -P "(?<=Push  URL: )http(s?)://.*\..*\/.*\.git"`
http=`echo $origin | grep -o -P "http(s?)://"`
repo=`echo $origin | grep -o -P "(?<=:\/\/).*\..*\/.*\.git"`
origin=$http$1:$2@$repo
if git push --repo "$origin"; then
	echo "Credentials okay"
else
	echo "Credentials not okay"
	exit 1
fi

while true
do
	[ -n "`git status -s`" ] && git add . && git commit -m "Added files" && git push --repo "$origin"
done
