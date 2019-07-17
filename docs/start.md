# 【一俢哥的 Liunx 学习笔记】万事开头难

从事互联网技术工作以及很长时间了，一直在研究前端相关技术（当然后端技术也一直接触），虽然前端也会设计到一些 Liunx 的操作，但是对 Liunx 的理解程度还是不够，所以我又做了一个计划，开始从头系统的学习 Liunx，第一阶段做到熟练运用。

二话不说，开始搞一台装有 Liunx 系统的机器。我从家里翻出十年前的电脑，打开后听到熟悉的 winXP 开机声音，怀念起了年轻时学习电脑的时期。过去的还得过去，接下来开始重新装机，我选择的是全球排名第一的 Linux 发行版 Manjaro，它是一款基于 Arch Linux
，在 Liunx 圈，Arch 有 3 个无与伦比的优势：

* 滚动更新可以使软件保持最新；
* AUR 软件仓库有着世界上最齐全的 Linux 软件；
* 丰富的 Wiki 和活跃的社区让所有问题都可以快速得到满意的答案。

开始安装过程：

* 制作启动盘
* 安装
* 安装软件

## 制作启动盘

* 下载 Liunx 镜像文件
    * 到[官网](https://manjaro.org/get-manjaro/)下载自己想要的版本，我下载的是官方的 XFCE 版本
* 下载制作启动盘工具
    * 我选择的是 [Rufus](https://rufus.ie/en_IE.html?utm_source=hacpai.com)
* 制作启动盘
    * 打开 Rufus
    * 选择镜像文件
    * 选择一些配置
    * 点击开始等待
    * 最后一步注意使用 **DD 模式**

## 安装

* 开机 F12（根据不同的电脑来） 进入选择引导启动
* 选择 U盘 启动
* 进入启动界面，一些选择项
    * 时区
    * 键盘
    * 语言
    * 驱动（注意，选择：non-free，会自动帮你安装驱动）
    * 启动
* 最后选择启动（Boot）会进入 Manjaro 主界面
* 选择 “启动安装程序”
* 接下来按照步骤一步一步来
* 其中有一项*分区*，本次操作也是糊里糊涂，不知道怎么分配，随便弄了一下，未来再继续关注这一点
* 最后就是等待

## 安装软件
Manjaro 是通过 pacman 来管理软件的，接下来简单的介绍一下：

### 配置数据源
* 更新镜像排名：sudo pacman-mirrors -i -c China -m rank
* 更新数据源：sudo pacman -Syy 

### 常用软件
* 终端：zsh
    * sudo pacman -S zsh
    * chsh -s /bin/zsh - vim
* 文本编辑：vim
  * sudo pacman -S vim
  * curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
* Chrome
  * https://www.fosslinux.com/2103/how-to-install-google-chrome-in-manjaro-linux.htm
* 输入法
  * sudo pacman -S fcitx
  * sudo pacman -S fcitx-sogoupinyin

```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

### 开发环境
* git
    * sudo pacman -S git
* vs code
    * 直接用软件管理工具安装
* node
    * sudo pacman -S npm
    * sudo pacman -S nodejs
    * https://github.com/nvm-sh/nvm

### 其它
* OpenSSH
    * sudo pacman -S openssl
    * 开机启动：sudo systemctl enable sshd.service
    * 立即启动：sudo systemctl start sshd.service
    * 状态：sudo systemctl status sshd.service
* NetTools
    * sudo pacman -S net-tools
* 对于笔记本，关合后继续保持工作状态
    * /etc/system/logind.conf
    * HandleLidSwitch=lock
    * systemctl restart systemd-logind
* 目录映射文件
    * vim /etc/xdg/user-dirs.conf
        * enabled=False
    * vim .config/user-dirs.dirs

```
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Download"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

## 总结
Manjaro 的安装过程还是比较友好和顺利，安装好后我们需要做一些简单配置和软件的安装，在加上 Manjaro 本身是有界面的，操作起来没有什么障碍，不过未来在学习 Liunx 的过程中，我们尽量去使用命令行，除非是要用它做文案、设计性质的工作。接下来的路程还需要慢慢体会它，慢慢的熟练它。

〖坚持的一俢〗