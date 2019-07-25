# 【一俢哥的 Liunx 学习笔记】调兵遣将
Liunx 系统的运行，需要大量的程序参与，如果没有程序的系统，那整个系统就成了一个寂静的兵马俑，一个一个没有生机的士兵存放的地方，如果要让整个军队运作起来，需要骑兵、步兵、弓弩手等等协作完成各种任务，调动起他们的积极性，才能让整个军队充满生机。Liunx 系统也一样，这些二进制的执行会行程一个一个的程序，程序会让系统的磁盘、内容、CPU 运作起来，这样系统也会起到自己应有的作用。

本篇文章你会学习到：
* Job 管理
* 程序管理
* 系统资源
* SELiunx

## Job 管理
在 Linux 下，可以简单的把 Job 理解为，一个或多个命令及其运行的任务。也就是说，之前所所的 `cp` `mv` `tar`，等在 bash 环境中运行的命令就是 Job，那么我们控制这些任务的运行状况，就是 Job 管理。要进行 bash 的 Job 管理必须要注意到的限制是：

* 这些工作所触发的程序必须来自于你 shell 的子程序（只管理自己的 bash）；
* 前景：你可以控制与下达指令的这个环境称为前景的工作 （foreground）；
* 背景：可以自行运行的工作，你无法使用 [ctrl]+c 终止他，可使用 bg/fg 调用该工作；
* 背景中“执行”的程序不能等待 terminal/shell 的输入（input）

Job 管理相关命令

* jobs：查看当前背景工作状态；
    * -l -r -s
* &：将命令放到背景总执行；
* fg：将背景的任务调到前景来处理；
* bg：让工作在背景下的状态变成运行中；
* kill：管理背景的任务；
    * -l -1 -2 -9 -15
* nohup：离线执行任务。

当运行一个命令时，我们可以通过 `[ctrl]+z` 将它放入到背景中暂停起来，接下来我们可以通过 `jobs` 看到所有的 Job 工作状态：

```
jay-liunx% jobs -l
[1]  - 12773 suspended  vim hell.txt
[2]  + 12829 suspended  find / -print
```

通过 `fg` 命令可以将背景任务重新唤起：

```
jay-liunx% fg %2
// 省略...
```

通过 `&` 直接在背景中运行：

```
jay-liunx% tar -zpcf /tmp/etc.tar.gz /etc &
```

通过 `kill` 命令，来管理背景中的 Jobs：

```
jay-liunx% kill -9 %2
```

通过 `nohup` 命令，可以让任务离线执行，即使是注销了，任务也能执行完。

```
jay-liunx% nohup ./task.sh &
```

## 程序管理
Liunx 下的程序包括 Liunx 所有的命令、服务以及应用程序，他们运行后都会有一个 PID。管理程序，就是查看、修改、停止这些正在运行的程序。

* ps：查看某个时间点运行的程序；
    * -l -A -w -a -u -x
* top：查看实时程序的变化；
    * -d -b -n -p
* kill：关闭程序；
    * -l -1 -2 -9 -15
* killall：关闭所有相关程序；
    * -i -e -I
* nice：设置程序的执行权重；
* renice：重新调整程序的执行权重；

### 通过 `ps` 可以查看运行的程序：

```
jay-liunx% ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000 13174 13173  0  80   0 -  3094 -      pts/0    00:00:00 zsh
0 R  1000 13407 13174  0  80   0 -  3955 -      pts/0    00:00:00 ps
```

* F：程序标示；1-代表此子程序仅进行 fork 没事实际执行；4-代表程序权限为 root；
* S：程序状态；R-运行中；S-休眠中；D-不可唤醒；T：停止状态；Z：僵尸状态；
* UID：程序拥有者 ID；
* PID：程序 ID；
* PPID：父级程序 ID；
* C：CPU 使用率；
* PRI：执行优先级；
* NI：
* ADDR/SZ/WCHAN：和内存有关；
* TTY：登陆者终端位置；
* TIME：使用 CPU 时间；
* CMD：使用什么指令或者程序；

```
jay-liunx% ps -aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.2 122096  9360 ?        Ss   7月14   0:08 /sbin/init
root         2  0.0  0.0      0     0 ?        S    7月14   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        I<   7月14   0:00 [rcu_gp]
root         4  0.0  0.0      0     0 ?        I<   7月14   0:00 [rcu_par_gp]
root         6  0.0  0.0      0     0 ?        I<   7月14   0:00 [kworker/0:0H-kblockd]
root         8  0.0  0.0      0     0 ?        I<   7月14   0:00 [mm_percpu_wq]
root         9  0.0  0.0      0     0 ?        S    7月14   0:18 [ksoftirqd/0]
```

* USER：程序使用者；
* PID：程序 ID；
* %CPU：CPU 使用率；
* %MEM：内存使用率；
* VSZ：使用的虚拟内存；
* RSS：使用的固定内存；
* TTY：登陆者终端位置；
* STAT：程序状态（R/S/T/Z）；
* START：启动时间；
* TIME：使用 CPU 运行时间；
* COMMAND：使用什么指令；

### 通过 `top` 可以查看实时程序的变化：
我们一个一个看每个参数代表的含义：

```
jay-liunx% top
top - 19:11:27 up 9 days, 18:26,  2 users,  load average: 0.00, 0.00, 0.00
Tasks: 242 total,   1 running, 241 sleeping,   0 stopped,   0 zombie
%Cpu0  :  1.0 us,  1.0 sy,  0.0 ni, 98.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :  3932772 total,  1228504 free,   747788 used,  1956480 buff/cache
KiB Swap:        0 total,        0 free,        0 used.  2741112 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR    %CPU  %MEM     TIME+ COMMAND
13490 jay       20       16640   4064   3204 R   1.0   0.1   0:00.72 top
13469 root      20                           I   0.7         0:00.42 [kworker/u8:2-events_power_efficient]
 8949 jay       20      630440 122824  76112 S   0.3   3.1  10:24.50 /opt/google/chrome/chrome
 8986 jay       20      404064  69612  40268 S   0.3   1.8  22:47.71 /opt/google/chrome/chrome
```

* 第一行：当前时间, 开机时间, 登陆人数, 系统工作负载
* 第二行：任务总数, 运行数量, 休眠数量, 停止数量, 僵尸数量
* 第三行：CPU 使用状况
* 第四行：内存使用状况
* 第五行：交换区使用状况
* 第六行：实时程序状况
    * PID：程序 ID；
    * USER：程序使用者；
    * PR：Priority 的简写，程序优先级；
    * NI：Nice 的简写
    * %CPU：CPU 使用率；
    * %MEM：内存使用率；
    * TIME+：使用 CPU 累加时间；
    * COMMAND：使用什么指令

## 通过 `nice` 和 `renice` 设置程序执行优先级
nice 的范围是 -20 到 19，我们可以通过设置 nice 来改变程序的 Priority：

```
jay-liunx% ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000 14875 14874  1  80   0 -  3095 -      pts/0    00:00:00 zsh
0 R  1000 14880 14875  0  80   0 -  3955 -      pts/0    00:00:00 ps
jay-liunx% nice -n 5 zs
jay-liunx% ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000 14875 14874  0  80   0 -  3095 -      pts/0    00:00:00 zsh
0 S  1000 14888 14875  0  85   5 -  3103 -      pts/0    00:00:00 zsh
0 R  1000 14889 14888  0  85   5 -  3955 -      pts/0    00:00:00 ps
```

## 系统资源
出了前面的系统 Job、程序外，还有一些系统资源我们要查看，例如：内存、网络、开机状况等等：

* free：查看内存使用情况；
    * -b -t -s -c
* uname：查看系统与核心相关信息；
    * -a -s -r -m -p -i
* uptime：观察系统启动时间与工作负载；
* netstat：查看网络信息；
    * -a -t -u -n -l -p
* vmstat：查看系统资源变化。

这部分比较简单，自己尝试并查阅资料就可以搞懂里面的内容了。

## SELiunx
SELinux 是 “Security Enhanced Linux” 的缩写，是美国国家安全局（NSA）对于强制访问控制的实现，是 Linux历史上最杰出的新安全子系统。NSA是在Linux社区的帮助下开发了一种访问控制体系，在这种访问控制体系的限制下，进程只能访问那些在他的任务中所需要文件。SELinux 默认安装在 Fedora 和 Red Hat Enterprise Linux 上，也可以作为其他发行版上容易安装的包得到。这里不详细说这个，平时去修改相关内容也比较少。

〖坚持的一俢〗