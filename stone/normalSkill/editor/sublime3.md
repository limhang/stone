#sublime3安装使用

> [下载地址](#download)
>
> [插件安装](#Plugin)
>
> [偏好设置](#custom)
>
>
>

##<a name="download"></a>下载地址
[官网下载](https://www.sublimetext.com/3)


##<a name="Plugin"></a>插件安装
* package control

sublime安装插件的包管理工具
安装：

[参考](https://www.imjeff.cn/blog/62/)

[我的简书](http://www.jianshu.com/p/1f0fe9476e0f)

* emmet

前端编写神器

* sublimeCodeIntel

代码自动补全插件，[配置](http://blog.csdn.net/hehexiaoxia/article/details/54134756)

* sublimelinter

代码检错插件，[配置1](http://www.cnblogs.com/lhb25/archive/2013/05/01/sublimelinter-for-js-css-coding.html)  [配置2](https://segmentfault.com/a/1190000000389188)

* babel

支持es6与jsx语法高亮

##<a name="custom"></a>偏好设置

###建立软链：

```
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
```
如果之前有过软链，终端会提示exit，直接删除即可，rm XXX


###setting user的配置如下：

```
{
	"font_size": 16.0,
	"ignored_packages":
	[
		"Vintage"
	]
}

```

###key bindings user的配置如下：

```
[
	{ "keys": ["super+shift+a"], "command": "show_overlay", "args": {"overlay": "command_palette"} },
  { "keys": ["super+g"], "command": "show_overlay", "args": {"overlay": "goto", "text": ":"} },


	   {
      "keys": [
        "super+e"
      ],
      "args": {
        "action": "expand_abbreviation"
      },
      "command": "run_emmet_action",
      "context": [{
        "key": "emmet_action_enabled.expand_abbreviation"
      }]
    },
    {
      "keys": ["tab"],
      "command": "expand_abbreviation_by_tab",
      "context": [{
        "operand": "source.js",
        "operator": "equal",
        "match_all": true,
        "key": "selector"
      }, {
        "key": "preceding_text",
        "operator": "regex_contains",
        "operand": "(\\b(a\\b|div|span|p\\b|button)(\\.\\w*|>\\w*)?([^}]*?}$)?)",
        "match_all": true
      }, {
        "key": "selection_empty",
        "operator": "equal",
        "operand": true,
        "match_all": true
      }]
    }
]
```
