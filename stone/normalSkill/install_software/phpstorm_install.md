#phpstorm环境配置

##下载安装
直接官网下载安装就好，windwo的设置是在file中的setting，mac的设置是在perference中

##重点难点来了-_-
初学php，调试php框架的话，一个最重要的方式就是单步调试，断点调试，但是phpstorm没有断点调试，需要安装第三方的插件包，就是神器xdebug

###xdebug的安装
这个真不好弄，orz...

我遇到的坑，我以后还可能遇到。。。

1、使用brew安装，我第一次安装的时候，也想过使用homebrew，但是发现这个在国内被墙严重，然后想到使用镜像安装，但是发现清华和中科大的镜像都不可用了，python的镜像还是一直挺好用的

2、鉴于一的情况，直接在php代码中输入phpinfo()，得到本电脑php的基本信息，然后在[xdebug](https://xdebug.org/wizard.php)中，输入复制的php信息，然后自动匹配版本，下载，按照官网说明操作就完成了一大步。这个过程中，有坑出现在make操作，【我出现了faied 。。。php.h找不到】的问题，然后【解决：终端输入xcode-select install】

3、之后还需要在phstorm中进行很多的配置，还有在浏览器中下载xdebughelper，这个操作就是按照下面的【核心参考0】。

4、使用的时候需要在浏览器中打开xdebughelper

[核心参考0](https://segmentfault.com/a/1190000004339411) 基本就是按照这个来的，mac系统下