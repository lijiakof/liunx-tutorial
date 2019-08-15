#!/bin/bash

while [ "${yn}" != "yes" -a "${yn}" != "YES" ]
do
    read -p "Please input yes/YES to stop this program: " yn
done
echo "OK! you input the correct answer."

nu=20
s=0
for ((i=1; i<=${nu}; i=i+1)) 
do
    s=$((${s}+${i})) 
done
echo "The result of '1+2+3+...+${nu}' is ==> ${s}"