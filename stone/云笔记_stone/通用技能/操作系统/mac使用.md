#mac使用
引子：本文主要归纳mac系统日常使用中的小技巧


##强写ReadOnly文件
有些文件系统设置为只读属性，这个时候chmod模式改写后，还是不行，这时，可以尝试使用vim打开，然后命令模式下输入：

```
:w !sudo tee % > /dev/null
```
[参考](http://stackoverflow.com/questions/8253362/etc-apt-sources-list-e212-cant-open-file-for-writing)


##设置xx软件直接在终端打开
以sublime为例子

```
alias subl=\''/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'\'
```
**alias为linux的个人偏好设置文件，silicongo中有用到过**


##mac软件使用推荐
* **macdown** 编写markdown的一款软件
* **charles** 抓包工具，设置相关配置后，可抓取https请求