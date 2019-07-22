# 【一俢哥的 Liunx 学习笔记】管理文武大臣
作为系统管理员，账号和角色的管理是 Liunx 中比较重要的环节，因为整个系统的管理中，如何给不同的人分配不同的权限，就像皇宫一样，重要的地方也只能那几个核心人能进去，次重要的地方可能文武百官能进去，不重要的地方所有人都能进去。这篇比较简单易学，主要是因为操作简单。

本篇文章你会学习到：
* 角色管理
    * groups
    * groupadd
    * groupmod
    * groupdel
    * newgrp
* 账号管理
    * useradd
    * passwd
    * chage
    * usermod
    * userdel
    * id
    * finger
    * chfn
    * chsh
* 身份切换
    * su
    * sudo
    * visudo
* 查询使用者
    * w
    * who
    * last
    * lastlog
    * write
    * mesg
    * wall
    * mail

## 角色管理
角色管理是通过一些命令来新增、修改、删除角色信息，实践出真知：

```
[root@jay-liunx ~]# groups
sys network power lp wheel jay
[root@jay-liunx ~]# groupadd tech
[root@jay-liunx ~]# grep tech /etc/group /etc/gshadow
/etc/group:tech:x:1001:
/etc/gshadow:tech:!::
[root@jay-liunx ~]# groupmod -g 2001 -n itech tech
[root@jay-liunx ~]# grep tech /etc/group /etc/gshadow
/etc/group:itech:x:2001:
/etc/gshadow:itech:!::
[root@jay-liunx ~]# grepdel itech
```

## 账号管理
账号管理主要是通过一些命令来新增账户，修改账户权限、密码等等一些信息，我们直接上命令：

```
[root@jay-liunx ~]# useradd -m lily
[root@jay-liunx ~]# ls -ald /home/lily/
drwx------ 3 lily lily 4096  7月 20 19:01 /home/lily/
[root@jay-liunx ~]# passwd lily
Changing password for lily
New password：
Retype New Password：
passwd：Password successfully updated
[root@jay-liunx ~]# chage lily
Please enter a new value or hit the Enter key directly to use the default value
[root@jay-liunx ~]# userdel xxx
[root@jay-liunx ~]# id lily
uid=1002(lily) gid=1003(lily) groups=1003(lily)
[root@jay-liunx ~]# chfn lily
Changing finger information for lily
Login: lily          			Name: 李佳
Directory: /home/lily             	Shell: /bin/bash
On since Sat Jul 20 10:21 (CST) on console, idle 1:01 (messages off)
On since Sat Jul 20 10:22 (CST) on ttys000, idle 0:59
On since Sat Jul 20 10:38 (CST) on ttys002, idle 0:10
On since Sat Jul 20 11:16 (CST) on ttys003
On since Sat Jul 20 11:04 (CST) on ttys005, idle 0:07
No Mail.
No Plan.
[root@jay-liunx ~]# chsh -l
/bin/sh
/bin/bash
/bin/zsh
/usr/bin/zsh
/usr/bin/git-shell
[root@jay-liunx ~]# chsh -s /bin/bash
```

## 身份切换
在 Liunx 中不同身份的操作权限不同，这是之前说过的，在加上很多软件和服务都有自己的账户，它们管理系统中不同的部分，所以当我们安装软件、调试过程中经常要做身份的切换才能完成。

* su 用户名：可以切换到相应的用户角色上
* sudo：可以让你用其它身份的命令

## 查询使用者

### w & who
查询目前已登陆在系统上面的使用者，列出来的类似表格内容。自己翻译就行了：

```
[jay@jay-liunx ~]# w
 19:38:02 up 6 days, 18:53,  3 users,  load average: 0.00, 0.02, 0.00
USER     TTY        LOGIN@   IDLE   JCPU   PCPU WHAT
jay      tty7      14Jul19  6days 36.48s  1.89s xfce4-session
jay      pts/0     18:38    0.00s  0.21s  0.02s w
lily     pts/1     19:36    1:19   0.07s  0.07s -bash
```

```
[jay@jay-liunx ~]# who
jay      tty7         2019-07-14 00:45 (:0)
jay      pts/0        2019-07-20 18:38 (192.168.1.17)
lily     pts/1        2019-07-20 19:36 (192.168.1.17)
```

### last & lastlog
通过 last & lastlog 可以查询登陆日志，内容一看便知什么意思：

```
[jay@jay-liunx ~]# last
Username         Port     From             Latest
nobody                                     **Never logged in**
jay              pts/0    192.168.1.17     Fri Jul 19 22:16 +0800 2015  
```

```
[jay@jay-liunx ~]# lastlog
lily     pts/1        192.168.1.17     Sat Jul 20 19:36   still logged in
lily     pts/1        192.168.1.17     Sat Jul 20 19:04 - 19:36  (00:31)
mini     pts/1        192.168.1.17     Sat Jul 20 18:50 - 19:04  (00:13)
jay      pts/0        192.168.1.17     Sat Jul 20 18:38   still logged in
jay      pts/1        192.168.1.17     Fri Jul 19 22:16 - 03:41  (05:25)
```

### 发送消息 write & mesg & wall & mail
通过  `write` & `mesg` & `wall` & `mail` 可以给本机用户发送广播消息：

先通过 `mesg` 打开 `write` 权限，然后向某个用户发送消息：
```
[jay@jay-liunx ~]# mesg y
[jay@jay-liunx ~]# write lily
Hello,
I love u
```

```
[lily@jay-liunx ~]# 
Message from jay@jay-liunx
Hello,
I love u
EOF
```

通过 `wall` 可以广播给所有人：
```
[jay@jay-liunx ~]#  wall EveryoneHello
```

```
[lily@jay-liunx ~]# 
Message from jay@jay-liunx
EveryoneHello
```

至于 `mail` 的使用大家自己网上学习，基本上这种消息我们很少使用。

## 其它
大家记住这几个路径：

* /etc/passwrd
* /etc/shadow
* /etc/group
* /etc/gshadow