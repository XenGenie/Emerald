#!/bin/bash
array=(xCalendar xWormhole)

echo "Array size: ${#array[*]}"

echo "Array items:"
for item in ${array[*]}
do
    printf "Adding Files   %s\n" $item
    cd $item
    git add .
    git commit -m "automated nightly push"
    git push -u origin master
    cd ..
done