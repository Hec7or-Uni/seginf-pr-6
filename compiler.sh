#!/bin/bash

folders=$(ls)

for folder in $folders
do
    if [ -d $folder ]
    then
        cd $folder
        files=$(ls)
        for file in $files
        do
            if [ -f $file ]
            then
                name=${file%.*}
                make $name
            fi
        done
        cd ..
    fi
done