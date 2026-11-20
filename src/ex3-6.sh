#!/bin/bash

dir=$1

if [ ! -d "$dir" ]; then
    mkdir "$dir"
fi

touch file0.txt file1.txt file2.txt file3.txt file4.txt
tar -cvf "${dir}.tar" file0.txt file1.txt file2.txt file3.txt file4.txt

mkdir -p "$dir"
tar -xvf "${dir}.tar" -C "$dir"
