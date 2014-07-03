#!/bin/bash
for x in $(ls -d */)
do 
	pattern='^.*[^/]'    #Regular expressions are "greedy", they'll match the longest substring they can from the 
	[[ $x =~ $pattern ]]   #Apply regex
	x=${BASH_REMATCH[0]}
	printf "Remove  %s\n" $x
	git rm $x -r
	printf "Adding submodule %s .git\n" $x
	git submodule add -b master -f https://github.com/SuperDomX/$x $x
done
