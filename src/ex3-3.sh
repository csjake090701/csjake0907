#!/bin/bash

sum=0
count=$#

for score in "$@"; do
    sum=$((sum + score))
    if [ "$score" -ge 90 ]; then
        echo "$score: A"
    else
        echo "$score: B"
    fi
done

avg=$(echo "scale=2; $sum / $count" | bc)
if [ "$(echo "$avg >= 90" | bc)" -eq 1 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균: $avg, 평균 등급: $avg_grade"
