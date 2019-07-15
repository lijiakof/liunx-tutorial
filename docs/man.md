# 【一俢哥的 Liunx 学习笔记】神一样的男人
要想熟悉 Liunx 的命令，需要求助于神一样的男人，那就是 man page，它可以帮助你更好的了解各个命令的用法，其实 man 是 manual 的简写。

我们输入命令 `man date` 屏幕中会出现：

```
DATE(1)                                 User Commands                                 DATE(1)

NAME
       date - print or set the system date and time

SYNOPSIS
       date [OPTION]... [+FORMAT]
       date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

DESCRIPTION
       Display the current time in the given FORMAT, or set the system date.

       Mandatory arguments to long options are mandatory for short options too.

       -d, --date=STRING
              display time described by STRING, not 'now'

       --debug
              annotate the parsed date, and warn about questionable usage to stderr

       -f, --file=DATEFILE
              like --date; once for each line of DATEFILE

       -I[FMT], --iso-8601[=FMT]
              output  date/time  in ISO 8601 format.  FMT='date' for date only (the default),
              'hours', 'minutes', 'seconds', or 'ns' for date and time to the indicated  pre‐
              cision.  Example: 2006-08-14T02:34:56-06:00

       -R, --rfc-email
              output  date  and  time in RFC 5322 format.  Example: Mon, 14 Aug 2006 02:34:56
              -0600

       --rfc-3339=FMT
              output date/time in RFC 3339 format.  FMT='date', 'seconds', or 'ns'  for  date
              and time to the indicated precision.  Example: 2006-08-14 02:34:56-06:00

       -r, --reference=FILE
              display the last modification time of FILE

       -s, --set=STRING
              set time described by STRING

       -u, --utc, --universal
              print or set Coordinated Universal Time (UTC)

       --help display this help and exit

       --version
              output version information and exit

       FORMAT controls the output.  Interpreted sequences are:

       %%     a literal %

       %a     locale's abbreviated weekday name (e.g., Sun)

       %A     locale's full weekday name (e.g., Sunday)

       %b     locale's abbreviated month name (e.g., Jan)

       %B     locale's full month name (e.g., January)

       %c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)

       %C     century; like %Y, except omit last two digits (e.g., 20)

       %d     day of month (e.g., 01)

       %D     date; same as %m/%d/%y

       %e     day of month, space padded; same as %_d

       %F     full date; like %+4Y-%m-%d

       %g     last two digits of year of ISO week number (see %G)

       %G     year of ISO week number (see %V); normally useful only with %V

       %h     same as %b

       %H     hour (00..23)

       %I     hour (01..12)

       %j     day of year (001..366)

       %k     hour, space padded ( 0..23); same as %_H

       %l     hour, space padded ( 1..12); same as %_I

       %m     month (01..12)

       %M     minute (00..59)

       %n     a newline

       %N     nanoseconds (000000000..999999999)

       %p     locale's equivalent of either AM or PM; blank if not known

       %P     like %p, but lower case

       %q     quarter of year (1..4)

       %r     locale's 12-hour clock time (e.g., 11:11:04 PM)

       %R     24-hour hour and minute; same as %H:%M

       %s     seconds since 1970-01-01 00:00:00 UTC

       %S     second (00..60)

       %t     a tab

       %T     time; same as %H:%M:%S

       %u     day of week (1..7); 1 is Monday

       %U     week number of year, with Sunday as first day of week (00..53)

       %V     ISO week number, with Monday as first day of week (01..53)

       %w     day of week (0..6); 0 is Sunday

       %W     week number of year, with Monday as first day of week (00..53)

       %x     locale's date representation (e.g., 12/31/99)

       %X     locale's time representation (e.g., 23:13:48)

       %y     last two digits of year (00..99)

       %Y     year

       %z     +hhmm numeric time zone (e.g., -0400)

       %:z    +hh:mm numeric time zone (e.g., -04:00)

       %::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)

       %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)

       %Z     alphabetic time zone abbreviation (e.g., EDT)

       By  default,  date  pads numeric fields with zeroes.  The following optional flags may
       follow '%':

       -      (hyphen) do not pad the field

       _      (underscore) pad with spaces

       0      (zero) pad with zeros

       +      pad with zeros, and put '+' before future years with >4 digits

       ^      use upper case if possible

       #      use opposite case if possible

       After any flags comes an optional field width, as a decimal number; then  an  optional
       modifier,  which  is  either E to use the locale's alternate representations if avail‐
       able, or O to use the locale's alternate numeric symbols if available.

EXAMPLES
       Convert seconds since the epoch (1970-01-01 UTC) to a date

              $ date --date='@2147483647'

       Show the time on the west coast of the US (use tzselect(1) to find TZ)

              $ TZ='America/Los_Angeles' date

       Show the local time for 9AM next Friday on the west coast of the US

              $ date --date='TZ="America/Los_Angeles" 09:00 next Fri'

DATE STRING
       The --date=STRING is a mostly free format human readable date string such as "Sun,  29
       Feb  2004  16:21:42  -0800"  or "2004-02-29 16:21:42" or even "next Thursday".  A date
       string may contain items indicating calendar date, time of  day,  time  zone,  day  of
       week, relative time, relative date, and numbers.  An empty string indicates the begin‐
       ning of the day.  The date string format is more complex  than  is  easily  documented
       here but is fully described in the info documentation.

AUTHOR
       Written by David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <https://www.gnu.org/software/coreutils/>
       Report any translation bugs to <https://translationproject.org/team/>

COPYRIGHT
       Copyright  © 2019 Free Software Foundation, Inc.  License GPLv3+: GNU GPL version 3 or
       later <https://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is  NO  WAR‐
       RANTY, to the extent permitted by law.

SEE ALSO
       Full documentation <https://www.gnu.org/software/coreutils/date>
       or available locally via: info '(coreutils) date invocation'

GNU coreutils 8.31                        March 2019                                  DATE(1)
```

## man page 的主要部分：

* NAME：指令说明
* SYNOPSIS：指令愈发
* DESCRIPTION：指令描述
* OPTIONS：语法中的可选项
* COMMANDS：
* FILES：
* SEE ALSO：其它参考
* EXAMPLE：指令示例

## man page 的操作：

* [Space]：下一页
* [Page Down]：下一页
* [Page Up]：上一页
* [Home]：到第一页
* [End]：到最后页
* /string：向下搜索
* ?string：向上搜索
* n,N：查找下一个
* q：结束

## man page 命令：
man (选项) (参数) 指令或数据

* man -f ：查询更多该命令相关的信息，等价于 whatis
* man -k ：查询所有该关键字相关信息，等价于 apropos
* man 1 ：查询某一个版本的文档

## info page
基本上，info 与 man 的用途其实差不多，都是用来查询指令的用法或者是文件的格式。但是与 man page 一口气输出一堆信息不同的是，info page 则是将文件数据拆成一个一个的段落，每个段落用自己的页面来撰写，并且在各个页面中还有类似网页的“超链接”来跳到各不同的页面中，每个独立的页面也被称为一个节点。

* 内容
    * File  Node  Next  Up  Prev
    * Info
    * Menu
* 操作
    * [Space]：下一页
    * [Page Down]：下一页
    * [Page Up]：上一页
    * [Tab]：在 node 之间移动
    * [Enter]：进入该 node

## 其它
* man page 存储在：`/usr/share/man/`
* info page 存储在：`/usr/share/info/`
* 其它文档存储在：`/usr/share/doc/`

〖坚持的一俢〗