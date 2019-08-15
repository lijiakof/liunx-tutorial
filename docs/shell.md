# 【一俢哥的 Liunx 学习笔记】内功心法 Shell
Shell 可谓是 Liunx 的内功心法，掌握好 Shell 脚本，你可以在 Liunx 的世界中呼风唤雨，它能进行类似于程序一样的撰写，而且不用编译就能够直接执行。

本篇文章你会学习到：
* Hello World!
* 数值运算
* 逻辑运算
* 默认变量
* 条件语句
    * if .... then
    * case ..... esac
* 循环语句
    * while do done, until do done
    * for...do...done
* 函数

## Hello World!
二话不说，先整个 `Hello World!` ：

```
#!/bin/bash

HELLO="Hello World!"
echo "${HELLO} \a \n"
exit 0
```

解读脚本：
* `#!/bin/bash` 声明这个脚本使用的 shell 名称，这里我们用的是 bash shell；
* `HELLO="Hello World!"` 声明变量 `HELLO` 并赋值 `Hello World!`；
* `echo "${HELLO} \a \n"` 执行 `echo` 打印函数，并传入 `"${HELLO} \a \n"` 值；
* `exit 0` 执行完成并返回 `0`；

是不是很简单，后面我们再加上一些可编程的运算、条件判断、循环语句，再结合上 Liunx 内部命令，就能玩出各种花样了。

## 数值运算
通过 `$((...))` 可以做一些做一些简单的运算，下面代码很容易理解：

```
#!/bin/bash

price=998
amount=13
total=$((${price}*${amount}))
echo ${total}
```

## 逻辑运算
我们可以通过 `[ ]` 来做逻辑运算，例如 `==`、`-o`、`-a` 等：

```
#!/bin/bash

[ "a" == "a" ] && echo "yes"
[ "a" == "" ] || echo "no"
[ "a" == "b" -o "a" == "a" ] && echo "yes"
```

## 默认变量
我们的指令是可以带入参数的，Shell 脚本也一样，可以在运行是将参数带入，记住以下 3 个内置变量就行：

* `$#`：参数的总个数；
* `$@`：所有参数；
* `$*`：`"$1" "$2" "$3" "$4"` 第几个参数；

```
#!/bin/bash

echo "The script name is        ==> ${0}"
echo "Total parameter number is ==> $#"
[ "$#" -lt 2 ] && echo "The number of parameter is less than 2\.  Stop here." && exit 0
echo "Your whole parameter is   ==> '$@'"
echo "The 1st parameter         ==> ${1}"
echo "The 2nd parameter         ==> ${2}"
```

执行 `sh params.sh abc xyz` 将打印如下结构，聪明人一看便知：

```
$ sh params.sh abc xyz 
The script name is        ==> params.sh
Total parameter number is ==> 2
Your whole parameter is   ==> 'abc xyz'
The 1st parameter         ==> abc
The 2nd parameter         ==> xyz
```

## 条件语句
Shell 脚本的条件语句很有意思，感觉是镜像写法，自己观察下面的写法，如果有过编程经验的人一看就懂，写法上和其它语言有一些差异，但是大体上能看懂语法糖：

```
#!/bin/bash

read -p "Please input （Y/N）: " yn
if [ "${yn}" == "Y" ] || [ "${yn}" == "y" ]; then
    echo "OK, continue"
elif [ "${yn}" == "N" ] || [ "${yn}" == "n" ]; then
    echo "Oh, interrupt!"
else
    echo "I don't know what your choice is"
fi
```

```
#!/bin/bash

echo "This program will print your selection !"
case ${1} in
  "one")
    echo "Your choice is ONE"
    ;;
  "two")
    echo "Your choice is TWO"
    ;;
  "three")
    echo "Your choice is THREE"
    ;;
  *)
    echo "Usage ${0} {one|two|three}"
    ;;
esac
```

## 循环语句
循环语句也是我们在编码过程中不可或缺的，跑不掉经典的两种 `while` 和 `for`：

```
#!/bin/bash

while [ "${yn}" != "yes" -a "${yn}" != "YES" ]
do
    read -p "Please input yes/YES to stop this program: " yn
done
echo "OK! you input the correct answer."
```

```
#!/bin/bash

nu=20
s=0
for ((i=1; i<=${nu}; i=i+1)) 
do
    s=$((${s}+${i})) 
done
echo "The result of '1+2+3+...+${nu}' is ==> ${s}"
```

## 函数
同样 Shell 也有函数功能，语法如下：

```
function functionName() {
    # something...
}
```

它起到复用的功效，不要重复自己：

```
#!/bin/bash

function print(){
    echo "Hello ${1}";
}

count=10
for ((i=0; i < ${count}; i++))
do
    print ${i}
done
```

## 总结
Shell 脚本整个语法上没有太大难度，入门很简单，但是要想深挖，我相信里面会有更多有趣的东西，整个编程体验也还不错，即开即用，这种脚本语言没有太多的束缚，可以帮助你快速简单的解决很多问题。

〖坚持的一俢〗