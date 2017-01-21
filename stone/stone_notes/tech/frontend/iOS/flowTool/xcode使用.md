#xcode8使用与版本上架
引子：本文主要归纳xcode的使用，与xcode8的上架


##xcode中创建文件夹
如果在xcode工程中new group，只是在视觉效果上分好了几个文件夹，方便分类管理，但在finder中并不会创建新的文件夹，在硬盘目录还是所有文件都并列在一个文件夹内，更恶心的是当你重新打开工程后，会发现刚才new的group已经不见了。那应该怎样建立文件夹呢？ 

**正确的方法是：**在finder找到把工程，新建一个文件夹aa，然后在xcode里面－－右键－－add files to "xxx"－－找到把文件夹aa－－完成，以后若要创建文件，在aa文件夹－－new file即可把文件添加进来，以后在包那里新建文件自然在这个包内。


##xcode快捷键
**1、打开了2个工程项目，怎么在2个工程项目中切换**

Q：'command' + '~'

**2、在.m和.h文件之间快速切换**

Q：'command' + 'ctrl' + '上/下'

**3、折叠代码操作**

Q：‘command’ + 'option' + '左/右'


##iOS系统升级后，xcode适配
iOS新系统发布后，xcode需要在添加支持文件，步骤如下：

```
（1）Xcode右击－选项－在Finder显示

（2）右击Xcode－显示包内容

（3）Contents-->Developer-->Platforms-->iPhoneOS.platform-->DeviceSupport

（4）网络下载的文件放入上述位置，完成
```

##xcode真机调试错误
**一、账号已绑定最大ID数**

**解决办法：**说明开发账号已绑定超过5台手机，目前解决办法就是重新注册一个账号。

**使用注意：**所有自己跑的app都可以使用同一个bundleID，前提是使用相同的开发者账号，运行的BuddleID不要随便的更改


##xcode8上架
**xcode8上架与7有较多不一样的地方**，目前整理不是很详细，[参考](http://www.jianshu.com/p/0d5c6ac48732)。
