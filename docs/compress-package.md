# 【一俢哥的 Liunx 学习笔记】包裹还是要打的
文件的压缩打包的好处一个是占用少量的磁盘空间，一个是加快传输速度，其它的就不多说了。所以对文件的压缩打包还是需要有的常规操作，这篇文章掌握起来也非常简单。

本篇文章你会学习到：
* 压缩
    * gzip
    * bzip2
    * xz
* 打包
    * tar

## 压缩
压缩有 gzip、bzip2、xz 几种方式，他们的使用方法都差不多，这里只对 gzip 压缩做一些示例：

* gzip
    * -c：将压缩的数据输出到屏幕上
    * -d：解压缩参数
    * -t：检查压缩文件的一致性
    * -v：显示原文件和压缩文件的压缩比
    * -#：压缩等级 -1 到 -9，默认是 -6
* zcat：类似于 cat
* zmore：类似于 more
* zless：类似于 less
* zgrep：按照关键词查询

```
jay-liunx% gzip test.txt
jay-liunx% ls
test.txt.gz

jay-liunx% gzip -d test.txt.gz
jay-liunx% ls
test.txt

jay-liunx% gzip -v test.txt
test.txt:	 81.1% -- replaced with test.txt.gz

jay-liunx% zcat test.txt.gz

```

## 打包
前面的 gzip、bzip2、xz 只是针对于文件进行压缩，没有对目录打包的功能，只有 tar 命令能够做到打包并压缩的功能。

* tar
    * -c：创建打包文件；
    * -t：察看打包文件的内容含有哪些文件名；
    * -x：解打包或解压缩的功能
    * -z：通过 gzip 打包压缩
    * -j：通过 bzip2 打包压缩
    * -J：通过 xz 打包压缩
    * -v：显示正在处理的文件
    * -f：要处理的文件名
    * -C：要解压的目录
    * -p：保留备份数据的原本权限与属性
    * -P：保留绝对路径

直接上示例：

```
jay-liunx% tar -czvf backup.tar ./hello-liunx
jay-liunx% ls
backup.tar  hello-liunx
jay-liunx% tar -tzvf backup.tar
drwxr-xr-x jay/jay           0 2019-07-18 00:30 ./hello-liunx/
-rw-r--r-- jay/jay       21894 2019-07-18 00:09 ./hello-liunx/test.txt
jay-liunx% tar -xzvf backup.tar -C ./tmp
```

* 压缩：tar -czvf
* 查看：tar -tzvf
* 解压：tar -xzvf


〖坚持的一俢〗