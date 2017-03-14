#记录我在vps的ssh中使用git遇到的坑

引子：我以为自己的git用的还算熟练了，但是在vps的ssh操作下，还是遇到了坑

##在vps中使用git提交不上去，我遇到的坑

一、修改.git中的config文件，将https改为ssh

二、查看.ssh文件夹下面有没有id_rsh.pub文件，就是ssh加密的公钥文件，git使用ssh加密上传的，这里我目前也不太懂，有空自己搭建一个git就知道了

[.ssh配置相关](https://help.github.com/articles/connecting-to-github-with-ssh/)

在有官方的参考文件后，我还是一直遇到坑，就是一直报我提交的公钥有问题，自己没有办法解决，还是网上找的，有时候遇到问题自己还是先搜搜吧，就是应为vim复制的问题

使用cat命令打印到终端，然后在复制就好了，orz

【cat ~/.ssh/id_rsa.pub】
