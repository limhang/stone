#记录我在vps的ssh中使用git遇到的坑

引子：我以为自己的git用的还算熟练了，但是在vps的ssh操作下，还是遇到了坑

##一些没注意到的知识
git的clone其实是分2种的，网上很多的说法也不靠谱，最靠谱的还是需要自己去理解其原理，追本溯源，方得始终。

git的clone操作有ssh模式和https模式，在vps操作下其实使用的是ssh，故clone的时候需要选中ssh模式的外链

[github的ssh模式和https模式](https://help.github.com/articles/which-remote-url-should-i-use/)

##在vps中使用git提交不上去，我遇到的坑

一、修改.git中的config文件，将https改为ssh

二、查看.ssh文件夹下面有没有id_rsh.pub文件，就是ssh加密的公钥文件，git使用ssh加密上传的，这里我目前也不太懂，有空自己搭建一个git就知道了

[.ssh配置相关](https://help.github.com/articles/connecting-to-github-with-ssh/)

在有官方的参考文件后，我还是一直遇到坑，就是一直报我提交的公钥有问题，自己没有办法解决，还是网上找的，有时候遇到问题自己还是先搜搜吧，就是应为vim复制的问题

使用cat命令打印到终端，然后在复制就好了，orz

【cat ~/.ssh/id_rsa.pub】

##心得
最近感觉自己解决问题的速度太慢了，我有点接受不了，不如这个vps上使用git的bug，我基本花了2个钟头，虽然大体思路找到的还算快，但是里面也有不少问题，一、不善于变幻思路，明知没效果还是尝试，所谓侥幸心理吧。二、不善于思考优良信息的提供地，其实这个bug最好的信息提供地肯定是github官网，我却没有直接到官网查找，还是绕了一圈
