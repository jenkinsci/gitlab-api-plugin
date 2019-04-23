#!/bin/bash

# this scripts generates a new tag based on the previous tag
# suppose tag was gitlab-api-v1.0.9 it generates gitlab-api-v1.1.0

arg=$1
first=""
second=""
third=""
count=1

# version numbers start from 12

for (( i=12; i < ${#arg}; i++ )); do

	ch=${arg:$i:1}

	if [[ "$ch" == "." ]]; then
		count=$((count + 1))
		continue
	elif [[ "$ch" == "-" ]]; then # as new commit hash gets added to the tags due to new commits
	    break
    fi

    case $count in
     1)
        first=${first}${ch}
        ;;
     2)
        second=${second}${ch}
        ;;
     3)
        third=${third}${ch}
        ;;
     *)
        break
        ;;
     esac
done

# update the third place
if [[ "$third" == "9" ]]; then
	third=0
	second="$((second + 1))"
else
    third="$((third + 1))"
fi

# update second and first place
if [[ "$second" == "10" ]]; then
    second=0
	first="$((first + 1))"
fi

TRAVIS_TAG="gitlab-api-v${first}.${second}.${third}"
echo $TRAVIS_TAG
