#!/bin/bash

dir=$1
mkdir -p "$dir"
cd "$dir" || exit 1

for i in 0 1 2 3 4; do
    fname="file${i}.txt"
    dname="file${i}"
    touch "$fname"
    mkdir -p "$dname"
    ln -s "../$fname" "$dname/$fname"
done
