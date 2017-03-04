# 购买的vps设置问题

## 购买的vps的配置

我用的是centos6的版本，其中python2.6的版本

## ss的设置


##python3.5开发环境的安装

因为现在官方还在维护的2的版本最低都是2.7的，所以开发python的话，需要比较新的版本，我选用的是3.5的

具体的终端命令如下：

	sudo yum install -y https://centos6.iuscommunity.org/ius-release.rpm
	sudo yum install -y python35u python35u-pip

执行完上面的命令后，在终端输入pyhton3.5就可以进入python3.5的开发环境

python虚拟环境的安装

	sudo pip3.5 install virtualenv
	
执行完之后就成功安装了python3的虚拟开发环境，具体使用可以参考install_software中python的部分
