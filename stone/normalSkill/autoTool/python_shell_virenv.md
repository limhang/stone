#python自动化脚本运行方案

引子：一直想用vps自动运行我的python脚本，但是有几个问题我一直都懒得去查和解决。。但是做coderhelper数据抓取的时候，我总不能每天都定点去抓数据吧，所以其实还是出于我很懒的原因，才有这个小文章的。

##Q-0
我写的脚本是运行在python3.5上的，所以系统自带的2.7的版本我是运行不了的，而且我习惯使用python的虚拟环境，不想污染自己的开发环境，那么我必须启动一个脚本然后打开运行环境，然后运行我的python脚本，在运行完成后，在退出

解决：我尝试使用python去写脚本，运行之后，发现没什么作用，搜索之后，发现网上关于这个的解决也比较少，大多是说source应该替换为‘.’，后来我又使用了shell脚本，但是效果是一样的，后来我意识到，其实是起作用了的，只是打开了activate环境，然后马上就关闭了而已，不会出现自己终端运行出现的(caogao)，这种现象。

##Q-1
怎样让脚本自动运行在vps上，关键词是crontab

第一步，使用crontab -e命令，可能出现的错是“Error detected while processing /root/.vimrc:”----解决：


```
[root@~]# vim ~/.bashrc
 
export EDITOR=/usr/bin/vim
  
[root@~]# source ~/.bashrc
```

第二步，编辑要定时执行的脚本，eg：


```
每天凌晨3:00执行备份程序：0 3 * * * /root/backup.sh

每周日8点30分执行日志清理程序：30 8 * * 7 /root/clear.sh

```

第三步，让root用户生效


```
crontab -u root /var/spool/cron/root
```

第四步，重启crontab服务


```
service crond restart

```

##参考
[第三步和第四步](http://blog.csdn.net/a1264716408/article/details/52523645)

[第一步和第二步](https://www.vpser.net/manage/crontab.html)
