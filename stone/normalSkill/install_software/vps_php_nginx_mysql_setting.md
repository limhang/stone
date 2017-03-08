##GoDaddy中vps设置参考
[godaddy环境配置参考](https://sg.godaddy.com/zh/help/build-a-lemp-stack-linux-nginx-mysql-php-centos-6-19186)这个比较坑的是，里面的教程安装php的版本比较低，教程中的php安装步骤不要照搬，但是可以借鉴

需要修改的地方：

sudo systemctl restart php-fpm 改为：/etc/init.d/php-fpm start

sudo chmod 666 /run/php-fpm/php-fpm.sock 改为：sudo chmod 666 /var/run/php-fpm/php-fpm.sock

我使用的vps是搬瓦工centos6的版本

##vsp中php5.6的安装

	rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
	yum remove php-common       # Need to remove this, otherwise it conflicts
	yum install php56w
	yum install php56w-mysql
	yum install php56w-common
	yum install php56w-pdo
	yum install php56w-opcache
	php --version               # Verify version has been upgraded
	
[php版本安装参考](http://stackoverflow.com/questions/21502656/upgrading-php-on-centos-6-5-final)


##vsp中mysql的setting

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



