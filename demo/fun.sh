#!/bin/bash

function print(){
    echo "Hello ${1}";
}

count=10
for ((i=0; i < ${count}; i++))
do
    print ${i}
done