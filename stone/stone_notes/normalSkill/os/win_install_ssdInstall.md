##window操作系统安装与ssd安装

引子：虽然目前很少使用window系统，但是最近安装ssd，又重新安装了一次window系统，自己虽装过很多次，但是发现每次还是要网上找不少资料，这里一并总结，以慰来者。

> [SSD安装](#ssdInstall)
> 
> [window系统安装](#windowInstall)
> 
> [参考](#info)

##<a name="ssdInstall"></a>ssd安装
* 拆开电脑底盖，更换硬盘
* 开机后提示，无法找到相应的启动盘
* 华硕电脑按f2进入bios中，找到advance（高级），在里面找到sata设置项，然后设置为AHCI模式，保存退出
* 插入U盘启动盘，进入U启动页面，选择列表的第二项，进入可视化安装系统中，**warning：**这里的进入列表第二项，不是直接安装了，而是进入可视化的操作系统中，进行安装，第二项一般是推荐的
* 进入可视化的安装系统中后，可以对硬盘进行分区，使用该系统中提供的DiskGenius进行分区操作，分区时，勾选**对齐到下列扇区数的整数倍**，完成以上操作后，可进行系统的安装。


##<a name="windowInstall"></a>window系统安装
上述SSD安装过程，基本涵盖了接下来的window安装，只需注意以下几点即可：

自制的U盘启动盘，不要在做其他用途，不可再进行保存资料，删除资料等U盘操作

window镜像文件采用的是风火山林的版本，开机后，发现显示比较奇怪，可以设置win主题为azro主题


##<a name="info"></a>参考
[U启动使用指南](https://m.baidu.com/from=1000539d/bd_page_type=1/ssid=0/uid=0/pu=usm@0,sz@1320_2001,ta@iphone_1_10.2_3_602/baiduid=672D3D9F56B995C2559EE59D6A536924/w=0_10_/t=iphone/l=3/tc?ref=www_iphone&lid=9013477081710831923&order=5&fm=alop&tj=www_normal_5_0_10_title&vit=osres&m=8&srd=1&cltj=cloud_title&asres=1&nt=wnor&title=u%E5%90%AF%E5%8A%A8%E4%B8%80%E9%94%AEu%E7%9B%98%E5%AE%89%E8%A3%85%E5%8E%9F%E7%89%88Win7%E7%B3%BB%E7%BB%9F%E6%95%99%E7%A8%8B_u%E5%90%AF%E5%8A%A8&dict=30&w_qd=IlPT2AEptyoA_yiEmPBingb5f9w8iyR28-xzdamAq_&sec=18302&di=c41ae020a4da5ec9&bdenc=1&tch=124.284.298.855.1.212&nsrc=IlPT2AEptyoA_yixCFOxXnANedT62v3IEQGG_zlJ_zq6o5bte4viZQRAWDbuL8iOJkfugTCcdcZPx7bzKzlq&eqid=7d164da67e7fa8001000000058837260&wd=&clk_info=%7B%22srcid%22:%221599%22,%22tplname%22:%22www_normal%22,%22t%22:1485009526642,%22xpath%22:%22div-a-h3%22%7D)

[什么是分区什么是逻辑分区](https://zhidao.baidu.com/question/1540147?fr=ala&word=%E9%80%BB%E8%BE%91%E5%88%86%E5%8C%BA&sf_samp_hit=1)

[DiskGenius使用指南](http://m.zol.com.cn/article/3063934.html)

[固态硬盘装系统](http://jingyan.baidu.com/article/ca2d939d3292daeb6c31ceed.html)

[华硕进bios](https://zhidao.baidu.com/question/1893815524168775660.html?fr=ala&word=%E5%8D%8E%E7%A1%95%E8%BF%9B%E5%85%A5bios%E6%8C%89%E5%93%AA%E4%B8%AA%E9%94%AE&sf_samp_hit=6&device=mobile&ssid=0&from=1000539d&uid=0&pu=usm@1,sz@1320_2001,ta@iphone_1_10.2_3_602&bd_page_type=1&baiduid=1A9B1F0CC3F22260A6189A2974730648&tj=zhidao_1_0_10_l1)