#!/bin/bash

# change dir into /people
cd ../people

# look for this file in each dir
target_file="README.md"

# loop through each dir and spit our first line of every file
for dir in $(find . -type d); do
  if [ -f "$dir/$target_file" ]; then 
    # echo $dir/$target_file;
    name=`head -n 1 "$dir/$target_file"` ;
    echo name 
  fi 
done
