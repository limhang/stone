需要修改的地方：

sudo systemctl restart php-fpm 改为：/etc/init.d/php-fpm start

sudo chmod 666 /run/php-fpm/php-fpm.sock 改为：sudo chmod 666 /var/run/php-fpm/php-fpm.sock

我使用的vps是搬瓦工centos6的版本

[参考的资料](https://sg.godaddy.com/zh/help/build-a-lemp-stack-linux-nginx-mysql-php-centos-6-19186)

[简书](http://www.jianshu.com/p/447e02d7951d)

##vsp_mysql_setting

###mysql mysql_serce 安装

第一步 ，使用yum安装mysql，【yum install mysql】出现如下错误

![使用yum install mysql出现错误](http://ok2nitkry.bkt.clouddn.com/vps_mysql_0.png)

第二步，分析错误之后，知道是一个文件和要安装的文件冲突了，删除冲突的文件就可以了

![解决错误的操作](http://ok2nitkry.bkt.clouddn.com/vps_mysql_1.png)

第三步，在次使用【yum install mysql】成功安装，没有报错了，如下：

![成功安装](http://ok2nitkry.bkt.clouddn.com/vps_mysql_2.png)

第四步，安装mysql service，配置相关，如下：

![设置相关和mysql service](http://ok2nitkry.bkt.clouddn.com/vps_mysql_3.png)

[第四步的参考出处](http://www.jianshu.com/p/447e02d7951d)



