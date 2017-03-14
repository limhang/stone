#webpack开发环境配置

缘由：准备开发一个前后端分离的网站了，前端准备使用webpack构建环境，在此记录下-_-

**目录**
>[1、基本概念了解](#section1)
>
>[2、最基本的webpack环境搭建](#section2)
>> [2-1、初始化webpack环境](#section2-1)
>>
>> [2-2、创建package.json配置文件](#section2-2)
>> 
>> [2-3、创建项目目录，文件](#section2-3)
>> 
>> [2-4、正式开始运行webpack](#section2-4)
>> 
>> [2-5、通过配置文件来使用webpack](#section2-5)
>> 
>> [2-6、更快捷的执行打包任务](#section2-6)
>
>[3、webpack进阶使用](#section3)
>
>[参考资料](#info)

##<a name="section1"></a>1、基本概念了解
* webpack

	WebPack可以看做是模块打包机：它做的事情是，分析你的项目结构，找到JavaScript模块以及其它的一些浏览器不能直接运行的拓展语言（Scss，TypeScript等），并将其打包为合适的格式以供浏览器使用。


* glup与grunt

	其实Webpack和另外两个并没有太多的可比性，Gulp/Grunt是一种能够优化前端的开发流程的工具，而WebPack是一种模块化的解决方案，不过Webpack的优点使得Webpack可以替代Gulp/Grunt类的工具。

	Grunt和Gulp的工作方式是：在一个配置文件中，指明对某些文件进行类似编译，组合，压缩等任务的具体步骤，这个工具之后可以自动替你完成这些任务。

##<a name="section2"></a>2、最基本的webpack环境搭建
###<a name="section2-1"></a>2-1、初始化webpack环境

	//全局安装
	npm install -g webpack
	//安装到你的项目目录
	npm install --save-dev webpack


###<a name="section2-2"></a>2-2、创建package.json配置文件

package.json包括当前的依赖模块，自定义的脚本任务

	使用npm init，自动创建package.json文件
	
###<a name="section2-3"></a>2-3、创建项目目录，文件
回到之前的空文件夹，创建app文件夹和public文件夹，app文件夹用来存放原始数据和我们将写的JavaScript模块，public文件夹用来存放准备给浏览器读取的数据（包括使用webpack生成的打包后的js文件以及一个index.html文件）。在这里还需要创建三个文件，index.html 文件放在public文件夹中，两个js文件（Greeter.js和main.js）放在app文件夹中

* index.html文件只有最基础的html代码，它唯一的目的就是加载打包后的js文件（bundle.js）

```
	<!DOCTYPE html>
	<html lang="en">
	  <head>
	    <meta charset="utf-8">
	    <title>Webpack Sample Project</title>
	  </head>
	  <body>
	    <div id='root'>
	    </div>
	    <script src="bundle.js"></script>
	  </body>
	</html>
```
	
* Greeter.js只包括一个用来返回包含问候信息的html元素的函数。

```
	// Greeter.js
	module.exports = function() {
	  var greet = document.createElement('div');
	  greet.textContent = "Hi there and greetings!";
	  return greet;
	};
```

* main.js用来把Greeter模块返回的节点插入页面。

```
	//main.js 
	var greeter = require('./Greeter.js');
	document.getElementById('root').appendChild(greeter());
```

###<a name="section2-4"></a>2-4、正式开始运行webpack


```
	//webpack非全局安装的情况
	node_modules/.bin/webpack app/main.js public/bundle.js
```

在node_modules文件夹下存在.bin文件夹

###<a name="section2-5"></a>2-5、通过配置文件来使用webpack

Webpack拥有很多其它的比较高级的功能（比如说本文后面会介绍的loaders和plugins），这些功能其实都可以通过命令行模式实现，但是正如已经提到的，这样不太方便且容易出错的，一个更好的办法是定义一个配置文件，这个配置文件其实也是一个简单的JavaScript模块，可以把所有的与构建相关的信息放在里面。

还是继续上面的例子来说明如何写这个配置文件，在当前练习文件夹的根目录下新建一个名为webpack.config.js的文件，并在其中进行最最简单的配置，如下所示，它包含入口文件路径和存放打包后文件的地方的路径。

```
module.exports = {
  entry:  __dirname + "/app/main.js",//已多次提及的唯一入口文件
  output: {
    path: __dirname + "/public",//打包后的文件存放的地方
    filename: "bundle.js"//打包后输出文件的文件名
  }
}
```

**操作:**现在如果你需要打包文件只需要在终端里你运行webpack(非全局安装需使用node_modules/.bin/webpack)命令就可以了，这条命令会自动参考webpack.config.js文件中的配置选项打包你的项目。

**warning：**“__dirname”是node.js中的一个全局变量，它指向当前执行脚本所在的目录。

###<a name="section2-6"></a>2-6、更快捷的执行打包任务

执行类似于node_modules/.bin/webpack这样的命令其实是比较烦人且容易出错的，不过值得庆幸的是npm可以引导任务执行，对其进行配置后可以使用简单的npm start命令来代替这些繁琐的命令。在package.json中对npm的脚本部分进行相关设置即可，设置方法如下：

```
{
  "name": "webpack-sample-project",
  "version": "1.0.0",
  "description": "Sample webpack project",
  "scripts": {
    "start": "webpack" //配置的地方就是这里啦，相当于把npm的start命令指向webpack命令
  },
  "author": "zhang",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^1.12.9"
  }
}
```

**warning:**package.json中的脚本部分已经默认在命令前添加了node_modules/.bin路径，所以无论是全局还是局部安装的Webpack，你都不需要写前面那指明详细的路径了。

npm的start是一个特殊的脚本名称，它的特殊性表现在，在命令行中使用npm start就可以执行相关命令，如果对应的此脚本名称不是start，想要在命令行中运行时，需要这样用npm run {script name}如npm run build。

##<a name="section3"></a>3、webpack进阶使用
1、生成Source Maps（使调试更容易）

2、使用webpack构建本地服务器

3、Loaders--（可以使用react开发）


【详细步骤移步参考资料】

##<a name="info"></a>参考资料
[简书基本资料参考](http://www.jianshu.com/p/42e11515c10f#)