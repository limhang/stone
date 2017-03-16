#vps_function_lists

##shadowsocks安装配置

##nginx+php5.6+mysql运行coderhelper

##python3.5环境配置，虚拟环境配置，爬虫

这vps中配置python的开发环境是很痛苦的，在开发爬虫程序的时候，链接数据库尤其如此，python的mysql链接很麻烦，开始在mac中使用的时候，遇到过mysql-python的坑，因为这个的python3支持很不好，所以改用mysqlclient，在mac上还是可以很好的安装，但是在vps上配置，则麻烦的多。

开始的时候一直报一个错误说是gcc找不到，后来问海龙，发现是我定位问题的能力不行，我忽视了第一个错误位置，定位bug一定要从第一个出错点开始找，找到了是gcc编译的时候，没有找到依赖文件，而我一直以为是后面描述的gcc版本过低。。

开始图文描述：

![开始我以为的错误](http://ok2nitkry.bkt.clouddn.com/vps_mysqlclient_0.png)

这个图片是开始我定位以为的错误

![真实的错误](http://ok2nitkry.bkt.clouddn.com/vps_mysqlclient_1.png)

这个是真实的错误，应为gcc编译的时候，会用-I指令去找依赖的文件，然后在/usr/include/python3.5m中找的，但是我没有这个文件夹，只有python2.6的，找了一圈没有找到，所以报错


![真实错误的证明](http://ok2nitkry.bkt.clouddn.com/vps_mysqlclient_2.png)

这个图片算是真实bug定位的证明


![后来还出现了一个错误](http://ok2nitkry.bkt.clouddn.com/vps_mysqlclient_3.png)


这个是我后来又遇到的一个错误，然后将python2.6的内容拷贝到python3.5m之后就可以用了，但是感觉还是有点问题，比较奇怪


