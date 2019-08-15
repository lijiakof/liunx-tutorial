#!/bin/bash

echo "Hello World!"
# echo $((20 / 2))
# echo "12.3*3.4" | bc

# read -p "Please input your first name: " firstname      # 提示使用者输入
# read -p "Please input your last name:  " lastname       # 提示使用者输入
# echo -e "\nYour full name is: ${firstname} ${lastname}" # 结果由屏幕输出

# echo -e "You SHOULD input 2 numbers, I will multiplying them! \n"
# read -p "first number:  " firstnu
# read -p "second number: " secnu
# total=$((${firstnu}*${secnu}))
# echo -e "\nThe result of ${firstnu} x ${secnu} is ==> ${total}"

# echo -e "This program will calculate pi value. \n"
# echo -e "You should input a float number to calculate pi value.\n"
# read -p "The scale number (10~10000) ? " checking
# num=${checking:-"10"}
# echo -e "Starting calcuate pi value.  Be patient."
# time echo "scale=${num}; 4*a(1)" | bc -lq

# read -p "Please input （Y/N）: " yn
# [ "${yn}" == "Y" -o "${yn}" == "y" ] && echo "OK, continue" && exit 0
# [ "${yn}" == "N" -o "${yn}" == "n" ] && echo "Oh, interrupt!" && exit 0
# echo "I don't know what your choice is" && exit 0

# echo "The script name is        ==> ${0}"
# echo "Total parameter number is ==> $#"
# [ "$#" -lt 2 ] && echo "The number of parameter is less than 2\.  Stop here." && exit 0
# echo "Your whole parameter is   ==> '$@'"
# echo "The 1st parameter         ==> ${1}"
# echo "The 2nd parameter         ==> ${2}"


# read -p "Please input （Y/N）: " yn
# if [ "${yn}" == "Y" ] || [ "${yn}" == "y" ]; then
#     echo "OK, continue"
#     exit 0
# fi
# if [ "${yn}" == "N" ] || [ "${yn}" == "n" ]; then
#     echo "Oh, interrupt!"
#     exit 0
# fi
# echo "I don't know what your choice is" && exit 0

# read -p "Please input （Y/N）: " yn
# if [ "${yn}" == "Y" ] || [ "${yn}" == "y" ]; then
#     echo "OK, continue"
# elif [ "${yn}" == "N" ] || [ "${yn}" == "n" ]; then
#     echo "Oh, interrupt!"
# else
#     echo "I don't know what your choice is"
# fi

# if [ "${1}" == "hello" ]; then
#     echo "Hello, how are you ?"
# elif [ "${1}" == "" ]; then
#     echo "You MUST input parameters, ex> {${0} someword}"
# else
#     echo "The only parameter is 'hello', ex> {${0} hello}"
# fi

# echo "This program will print your selection !"
# # read -p "Input your choice: " choice   # 暂时取消，可以替换！
# # case ${choice} in                      # 暂时取消，可以替换！
# case ${1} in                             # 现在使用，可以用上面两行替换！
#   "one")
#     echo "Your choice is ONE"
#     ;;
#   "two")
#     echo "Your choice is TWO"
#     ;;
#   "three")
#     echo "Your choice is THREE"
#     ;;
#   *)
#     echo "Usage ${0} {one|two|three}"
#     ;;
# esac

# function printit(){
#     echo -n "Your choice is "     # 加上 -n 可以不断行继续在同一行显示
# }
# printit()
# echo "This program will print your selection !"
# case ${1} in
#   "one")
#     printit; echo ${1} | tr 'a-z' 'A-Z'  # 将参数做大小写转换！
#     ;;
#   "two")
#     printit; echo ${1} | tr 'a-z' 'A-Z'
#     ;;
#   "three")
#     printit; echo ${1} | tr 'a-z' 'A-Z'
#     ;;
#   *)
#     echo "Usage ${0} {one|two|three}"
#     ;;
# esac

# while [ "${yn}" != "yes" -a "${yn}" != "YES" ]
# do
#     read -p "Please input yes/YES to stop this program: " yn
# done
# echo "OK! you input the correct answer."

# until [ "${yn}" == "yes" -o "${yn}" == "YES" ]
# do
#     read -p "Please input yes/YES to stop this program: " yn
# done
# echo "OK! you input the correct answer."

# s=0  # 这是加总的数值变量
# i=0  # 这是累计的数值，亦即是 1, 2, 3....
# while [ "${i}" != "100" ]
# do
#     i=$((i+1))   # 每次 i 都会增加 1 
#     s=$(($s+$i))  # 每次都会加总一次！
# done
# echo "The result of '1+2+3+...+100' is ==>$s"

# users=$(cut -d ':' -f1 /etc/passwd)    # 撷取帐号名称
# for username in ${users}               # 开始循环进行！
# do
#     id ${username}
# done

# read -p "Please input a number, I will count for 1+2+...+your_input: " nu
# s=0
# for ((i=1; i<=${nu}; i=i+1)) 
# do
#     s=$((${s}+${i})) 
# done
# echo "The result of '1+2+3+...+${nu}' is ==> ${s}"

exit "Finished deploy."