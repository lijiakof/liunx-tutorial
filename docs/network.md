# 【一俢哥的 Liunx 学习笔记】飞鸽传书
在与系统打交道的过程中，网络是必不可少的，就好比战争中的通讯一样重要，古代通过飞鸽传书来下达指令和信息，那么 Liunx 中呢，我们如何完成这件事情。

本篇文章你会学习到：
* net-tools vs iproute2
* ssh
* ufw

## net-tools vs iproute2
`net-tools` 是老牌网络工具，它提供了丰富的指令来对系统的网络进行配置管理，不过它正在被 `ip` 命令所取代，`iproute2` 套件里提供了新一代的网络管理相关的命令。接下来我们会对这两个套件进行对比介绍：

* 邻居
    * arp -na
    * ip neigh
* 地址和链路配置
    * ifconfig
    * ip link & ip addr
* 摘要
    * ifconfig -s
    * ip -s link
* 启动指定网络设备/网卡
    * ifconfig eth0 up
    * ip link set eth0 up
* 组播
    * ipmaddr
    * ip maddr
* ip隧道
    * iptunnel
    * ip tunnel
* 统计
    * netstat
    * ss
* 路由
    * route
    * ip route
* 添加路由
    * route add
    * ip route add
* 删除路由
    * route del
    * ip route del
* 查看路由
    * route -n
    * ip route show
* 增加 VLAN
    * vconfig
    * ip link

## ssh
通过 ssh 我们可以远程连接到 Liunx ，这个命令可能是我们使用得最多得，因为对服务器得任何操作时，首先要远程登陆上去：

* 远程登陆：ssh user@192.168.1.123
* 远程执行命令：ssh user@192.168.1.123 tar -czvf test.tar /home/user/tmp
* 远程拷贝：
    * scp abc.tar user@192.168.1.167:/home/user
    * scp user@192.168.1.167:/home/user/abc.tar /Users/jay/
    * scp -r user@192.168.1.167:/home/user/tmp /User/jay/tmp
* 生成密钥对：
    * 客户端机器：ssh-keygen -t rsa
        * /home/lijia/.ssh/id_rsa
        * /home/lijia/.ssh/id_rsa.pub
    * 目标服务器：ssh-copy-id -i id_rsa.pub user@192.168.1.123
        * /home/user/.ssh/authorized_keys

## ufw
我们可以远程登陆机器或者远程访问机器，的确对使用者有了好处，因为机器是完全暴露在互联网上，如果一旦有利可图黑客们会想尽办法进入你的机器，这样一来安全方面又是一个问题。正所谓魔高一尺道高一丈，防火墙技术的出现，让网络安全得到了保证。

* 安装防火墙：sudo pacman -S ufw
* 开启防火墙：sudo systemctl start ufw
* 开机启动：sudo systemctl enable ufw
* 打开端口：sudo ufw allow 22
* 关闭端口：sudo ufw deny 111
* 查看状态：sudo ufw status

〖坚持的一俢〗