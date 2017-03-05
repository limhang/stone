需要修改的地方：

sudo systemctl restart php-fpm 改为：/etc/init.d/php-fpm start

sudo chmod 666 /run/php-fpm/php-fpm.sock 改为：sudo chmod 666 /var/run/php-fpm/php-fpm.sock

我使用的vps是搬瓦工centos6的版本

[参考的资料](https://sg.godaddy.com/zh/help/build-a-lemp-stack-linux-nginx-mysql-php-centos-6-19186)

[简书](http://www.jianshu.com/p/447e02d7951d)



