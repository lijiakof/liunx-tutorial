# 【一俢哥的 Liunx 学习笔记】出招表

## 开关机
* sync
* shutdown
* reboot
* halt
* poweroff

## 帮助
* man
    * -k -f 1 
* info
* --help

## 权限
* rwx=421
* chgrp
* chown
* chmod

## 文件目录管理
* 目录操作
    * cd
        * . .. - ~ ~account
    * pwd
    * mkdir
    * rmdir
    * ls
        * -a -d -f -h
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
* ln
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
* zip
* bzip2
* xz
* tar
* xfsdump
* xfsrestore

## Vim

## 账号管理
* 用户
    * useradd
    * passwd
    * usermod
    * userdel
    * id
    * finger
    * chfn
    * chsh
* 组
    * groupadd
    * groupwd
* ACL
    * getfacl
    * setfacl
* 身份切换
    * su
    * sudo
    * visudo

## 程序管理
* ps
* top
* nice
* renice
* pstree
* kill
* killall
* uptime
* netstat
* dmesg
* vmstat


## 服务&进程
* daemon
* systemctl
* systemd

## 网络

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