#git使用

引子：本文主要介绍git日常使用

##多人合作冲突解决

多人合作中，经常遇到版本拉取报错，此时，说明自己修改的版本和拉取的版本，都修改了**同一文件**，解决办法：先提交自己的修改版本，然后拉取，拉取之后，会有报错，和小伙伴，一起解决报错，决定删除或修改部分冲突代码，然后提交推送。

**简洁版：**一般先拉取更新，拉取不了就提交再拉取，再合并，在提交推送


##在本地创建一个分支

```
git checkout -b master origin/master
```
后面添加的后缀表示从远端拉取然后新建，需要本地仓库干净


##放弃所有本地修改

```
git reset --hard ORIGIN/BRANCH
```
例子，比如master分支：

```
git reset --hard origin/master
```


##常用操作
* 查看分支：git branch

* 创建分支：git branch <name>

* 切换分支：git checkout <name>

* 创建+切换分支：git checkout -b <name>

* 合并某分支到当前分支：git merge <name>

* 删除分支：git branch -d <name>


##版本回退相关
HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭

穿梭前，用git log可以查看提交历史，以便确定要回退到哪个版本。

要重返未来，用git reflog查看命令历史，以便确定要回到未来的哪个版本。

使用命令：

```
git reset --hard commit_id
```

##commit后，github上没有打卡记录
* 用户名或者邮箱跟github没有关联上， github认为不是你提交的， 不统计。
* ork 的项目， 不统计
* 没有在版本库的master【默认分支】上提交

用户名和邮箱跟github没有匹配上

```
git config --global user.email "你的邮件地址"
git config --global user.name "你的Github用户名"
```

###例子：
假设你有3个commit如下：

* commit 3
* commit 2
* commit 1
* 
其中最后一次提交commit 3是错误的，那么可以执行：

```
git reset --hard HEAD~1
```

然后再使用git push origin master -f ，推送到远程服务器，需要指定针对远端那个分支，如果不指定，则会推送到所有的分支？所以上面的评论需要加上origin mater

你会发现，HEAD is now at commit 2。

值得注意的是，这类操作比较比较危险，例如：在你的commit 3之后别人又提交了新的commit 4，那在你强制推送之后，那位仁兄的commit 4也跟着一起消失了。**危险操作，慎用！！**




