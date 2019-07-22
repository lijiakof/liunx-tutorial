# 【一俢哥的 Liunx 学习笔记】出招表

## 开关机
* sync
* shutdown
    * -t -k -r -h -n -c -f -F time message
* reboot
    * -n -w -d -f -i
* halt
    * -n -w -d -f -i -p
* poweroff
    * 

## 帮助
* man
    * -k -f 1 
* info
* --help

## 权限
* rwx=421
* chgrp
    * -c -h -R -v 
* chown
    * user group -c -f -h -v -R
* chmod
    * u + r -c -f -v -R

## 文件目录管理
* 目录操作
    * cd
        * . .. - ~ ~account
    * pwd
    * mkdir
        * -p
    * rmdir
        * -p
    * ls
        * -a -l -r -t -A -F -R
* 文件操作
    * cp
    * rm
    * mv
    * basename
    * dirname
    * file
* 文件内容查阅
    * cat
    * tac
    * nl
    * more
    * less
    * head
    * tail
    * od
* 文件搜索
    * which
    * whereis
    * locate
    * updatedb
    * find

## 文件系统操作
* 查看磁盘信息
    * df
        * -a -k -m -n -h -H -T -i
    * du
        * -a -h -s -S -k -m
        * du --max-depth=1 -h
* ln
* umask
    * -S
* 磁盘操作
    * lsblk
    * blkid
    * parted
    * gdisk
    * fdisk
    * mkfs.xfs
    * mkfs.ext4
    * mount
    * umount
    * mknod
* swap

## 打包压缩备份
* gzip
    * -c -d -t -v -#
* zcat, zmore, zless, zgrep
* bzip2
    * -c -d -k -z -v -#
* bzcat, bzmore, bzless, bzgrep
* xz
    * -d -t -l -k -c -#
* xzcat, xzmore, xzless, xzgrep
* tar
    * -c -t -x -z -j -J -v -f -C -p -P

## Vim

## 账号管理
* 用户
    * useradd
    * passwd
    * chage
    * usermod
    * userdel
    * id
    * finger
    * chfn
    * chsh
* 组
    * groups
    * groupadd
    * groupmod
    * groupdel
    * newgrp
* ACL
    * getfacl
    * setfacl
* 身份切换
    * su
    * sudo
    * visudo
* 登陆信息
    * w
    * who
    * last
    * lastlog
* 发送消息
    * write
    * mesg
    * wall
    * mail

## 程序管理
* job
    * jobs
        * -l -r -s
    * &
    * nohup 
    * fg
    * bg
    * kill
        * -l -1 -2 -9 -15
* 程序
    * ps
        * -l -A -w -a -u -x
    * top
        * -d -b -n -p
    * pstree
    * killall
        * -i -e -I
    * nice
    * renice
    * free
        * -b -t -s -c
* 系统资源
    * uname
        * -a -s -r -m -p -i
    * uptime
    * netstat
        * -a -t -uu -n -l -p
    * dmesg
    * vmstat


## 服务&进程
* daemon
* systemctl
* systemd

## 网络
* ufw
    * enable
    * reload
    * allow
    * deny
    * status

## 目录

* /usr/
    * share/
        * man/：man page
        * info/：info page
        * doc/：其它文档
* /etc/
    * group
    * passwd
    * shadow
    * gshadow