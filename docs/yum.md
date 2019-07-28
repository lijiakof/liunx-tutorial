# 【一俢哥的 Liunx 学习笔记】大管家 Yum
Yum（Yellow dog Updater, Modified）是一个软件包管理器。基于 RPM 包管理，能够从指定的服务器自动下载 RPM 包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。开发人员用过很多类似东西，例如：nodejs 的 npm，java 的 maven、ant 等，与 yum 不同的是开发人员使用的都是开发工具依赖包，而 yum 是可使用的软件包。

本篇文章你会学习到：
* 安装
* 更新
* 查找
* 卸载
* 清除缓存

yum 既然是来管理软件包的，它的功能无非是：查询软件、安装软件、更新软件和卸载软件，我们一起来使用吧。

## 安装

* 全部安装：yum install 
* 安装指定的安装包：yum install package_name
* 安装程序组：yum groupinsall group_name

## 更新

* 全部更新：yum update 
* 更新指定程序包：yum update package_name 
* 检查可更新的程序：yum check-update 
* 升级指定程序包：yum upgrade package_name 
* 升级程序组：yum groupupdate group_name

## 查找

* 显示安装包信息：yum info package_name 
* 显示所有已经安装和可以安装的程序包：yum list 
* 显示指定程序包安装情况：yum list package_name
* 显示程序组：yum groupinfo group_name
* 搜索安装包：yum search keyword

## 卸载

* 删除程序包：yum remove package_name
* 删除程序组：yum groupremove group_name
* 查看程序依赖情况：yum deplist package_name

## 清除缓存

* 清除缓存目录下的软件包：yum clean packages 
* 清除缓存目录下的 headers：yum clean headers
* 清除缓存目录下旧的 headersyum clean oldheaders
* 清除缓存目录下的软件包及旧的headers：yum clean, yum clean all (= yum clean packages; yum clean oldheaders) 

不同的 Liunx 发行版本，使用的不同的程序包管理软件，市面上有：CentOS 用 yum、Manjaro 用 pacman、Ubuntu 用 apt、Fedora 用 dnf、Mac 用 homebrew，这么多大家可以自行选择，哪个适合自己哪个最好，常用指令的用法上都差不多。

〖坚持的一俢〗