#!/bin/bash

cd ../people

target_file="README.md"

for dir in $(find . -type d); do
 if [ -f "$dir/$target_file" ]; then
  # echo $dir/$target_file;
  name=`head -n 1 "$dir/$target_file"`;
  echo $name;		
 fi
done
