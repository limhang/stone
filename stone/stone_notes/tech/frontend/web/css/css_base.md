#css基础知识

引子：前期有看过一些css相关的书籍，但是一直都没有做总结和记录，现在开始吧~~

**目录：**
> [css设计指南3](#base)
> >[1.Html标记与文档结构](#section0)
> > >[1-1.Html标记基础](#section0_0)
> > >
> > >[1-2.Html文档结构](#section0_1)
> > 
> > [2.css工作原理](#section1)
> > >[2-1.css基本使用](#section1_0)
> > >
> > >[2-2.选中Html标签的方法](#section1_1)
> > >
> > >[2-3.伪类和伪元素](#section2_3)
>
>
> [参考](#info)

##<a name="base"></a>css设计指南3
###<a name="section0"></a>1.Html标记与文档结构
####<a name="section0_0"></a>1-1.Html标记基础
#####1-1-1.html标签的2种写法

* 闭合标签

	<标签名 属性_1="属性值" 属性_2="属性值">文本内容</标签名>
	
	```
	<h1>Words by Dogsworth</h1>   <p>I wandered lonely as a dog.</p>
	```
* 自闭合标签

	<标签名 属性_1="属性值" 属性_2="属性值" />
	
	```
	<img src="images/cisco.jpg" alt="My dog Cisco" />
	```
	
#####1-1-2.基本的块级标签和行内标签
* 块级标签

	```
 <h1>-<h6> :6 级标签，<h1>表示最重要 
 <p>:段落 <ol>:有序列表 <li>:列表项 <blockquote>:独立引用
	```

* 行内标签

	```
<a>:链接(anchor，锚) 
<img>:图片<em>:斜体<strong>:重要<abbr>:简写
<cite>:引证<q>:文本内引用
	```

####<a name="section0_1"></a>1-2.Html文档结构

* Html文档结构概览（流布局，块级元素，行内元素）

	所谓“文档流”的效果，也就是 HTML 元素会按照它们各自在标记中 出现的先后顺序，依次从页面上方“流向”下方。

	几乎所有 HTML 元素的 **display** 属性值要么为 **block**，要么为 **inline**。最明显的一 个例外是 table 元素，它有自己特殊的 display 属性值。

	**块级元素**(比如标题和段落)会相互堆叠在一起沿页面向下排列，每个元素分别占 **一行**。而**行内元素**(比如链接和图片)则会相互并列，只有在**空间不足以并列**的情 况下才会**折到下一行**显示。


* 块级元素（**块级元素盒子会扩展到与父元素同宽**）

	显示块级元素的轮廓之后，可以发现元素盒子比它们包含的文本要 大一些。**每个盒子的高度比内容稍微高一点**，而**宽度跟浏览器窗口一样宽**!
	
	在简易页面中，所有块级元素的父元素都是 body，而它的宽度默认与浏览器窗 口一样宽(当然有少量边距)。因此，所有块级元素就与浏览器窗口一样宽了。说到 这，相信你就能理解为什么块级元素始终会占一行了。对了，就是因为它们始终会 保持与浏览器窗口同宽。这样一来，一个块级元素旁边也就没有空间容纳另一个块 级元素了。
	
* 行内元素（**行内元素盒子会“收缩包裹”其内容，并且会尽可能包紧**）

	说到这，你就可以理解为什么几个行内元素会并排显示在一行，而每个块级元素都 会另起一行了。


###<a name="section1"></a>2.css工作原理
####<a name="section1_0"></a>2-1.css基本使用
#####2-1-1.Html添加样式的3种方法(代码放在何处)
* 行内样式

	```<p style="font-size: 12px; font-weight:bold; font-style:italic; color:red;">Byadding inline CSS styling to this paragraph, you override the default styles.</p>
	```
	
* 嵌入样式

	```
	<head>		<!-- 其他 head 元素(如 meta、title)放在这里 -->
		<style type="text/css">       	 h1 {font-size:16px;}        	 p {color:blue;}  		</style></head>
	```
	
* 链接样式

	```
	<link href="styles.css" rel="stylesheet" type="text/css" />
	```

#####2-1-2.css命名使用规则（最简单的例子）

* 类似键值对的形式

	```
	p {color:red; font-size:12px; font-weight:bold;}
	```
* 多个选择符组合在一起使用

	```   h1, h2, h3 {color:blue; font-weight:bold;}
	```
	
####<a name="section1_1"></a>2-2.选中Html标签的方法（id,属性，上下文选择符）
#####2-2-1.上下文选择符
上下文选择符（后代组合式选择符）的格式如下:

标签 1 标签 2 {声明}

其中，标签 2 就是我们想要选择目标，而且只有在标签 1 是其祖先元素(不一定是父元素)的情况下才会被选中。**无论从该标签到作为 祖先的上下文之间隔着多少层次都没有关系。**

	article p {font-weight:bold;}

#####2-2-2.子选择符>
标签 1 > 标签 2

标签 2 必须是标签 1 的子元素，或者反过来说，标签 1 必须是标签 2 的父元素。与常 规的上下文选择符不同，这个选择符中的标签 1 不能是标签 2 的父元素之外的其他 祖先元素。

	section > h2 {font-style:italic;}

#####2-2-3.紧邻同胞选择符+
标签 1 + 标签 2
标签 2 必须紧跟在其同胞标签 1 的后面。 
	
	h2 + p {font-variant:small-caps;}
	
#####2-2-4.通用选择符*
通用选择符*(常被称为星号选择符)是一个通配符，它匹配任何元素，因此下面这条规则

	* {color:green;}

会导致所有元素(的文本和边框)都变成绿色。

#####2-2-5.ID 和类选择符
ID 和类为我们选择元素提供了另一套手段，利用它们可以不用考虑文档的层次结构。 只要你在 HTML 标记中为元素添加了 id 和 class 属性，就可以在 CSS 选择符中使用 ID 和类名，直接选中文档中特定的区域。

**ID 的用途是在页面中唯一地标识一个元素。正因为如此，同一个页面中的每一个 ID 属性，都必须有独一无二的值(名字)。好吧，换一个角度讲，每个 ID 名在页面中 都只能用一次。**

**类的目的是为了标识一组具有相同特征的元素，比如本章前面例子中的那个specialtext 类。**

* 类选择符

	1.通用类选择符
		
		     <p class="specialtext"> When a tag has a class attribute, you can target it           <span>regardless</span> of its position in the hierarchy.</p>
           
           .specialtext {font-style:italic;}
    
    2.标签带类选择符
    
    	p {font-family:helvetica, sans-serif; font-size:1.2em;}		.specialtext {font-style:italic;}		p.specialtext {color:red;}
		
		该规则只选择带 specialtext 类的段落。像这样组合标签 名和类选择符，可以让你更精确地选择特定的标签。

* ID选择符

	ID 与类的写法相似，而且表示 ID 选择符的#(井号)的用法，也跟表示类选择符的. (句号)类似。如果有一个段落像下面这样设定了 ID 属性	
		<p id="specialtext">This is the special text.</p>	
	那么，相应的 ID 选择符就是这样的:
	
		#specialtext {CSS样式声明}	或者这样的:		p#specialtext {CSS样式声明}

####<a name="section2_3"></a>2-3.伪类和伪元素
#####2-3-1.伪类
伪类这个叫法源自它们与类相似，但实际上并没有类会附加到标记中的标签上。伪类分两种。
1.UI(User Interface，用户界面)伪类会在 HTML 元素处于某个状态时(比如鼠标 指针位于链接上)，为该元素应用 CSS 样式。
2.结构化伪类会在标记中存在某种结构上的关系时(如某个元素是一组元素中的第 一个或最后一个)，为相应元素应用 CSS 样式。

* UI伪类

	1、链接伪类
	
		Link。此时，链接就在那儿等着用户点击。 
		Visited。用户此前点击过这个链接。		Hover。鼠标指针正悬停在链接上。	
		Active。链接正在被点击(鼠标在元素上按下，还没有释放)。
		
		a:link {color:black;}		a:visited {color:gray;}		a:hover {text-decoration:none;}		a:active {color:red;}
		
	**warning**：一个冒号(:)表示伪类，两个冒号(::)表示 CSS3 新增的伪元素。尽管浏览器目 前都支持对 CSS 1 和 CSS 2 的伪元素使用一个冒号，但希望你能习惯于用双冒号代 替单冒号，因为这些单冒号的伪元素最终可能都会被淘汰掉。
	
	2、:focus 伪类
	
		input:focus {border:1px solid blue;}
			会在光标位于 input 字段中时，为该字段添加一个蓝色边框。这样可以让用户明确地知道输入的字符会出现在哪里。

	3、:target 伪类
	
		如果用户点击一个指向页面中其他元素的链接，则那个元素就是目标(target)，可以 用:target 伪类选中它。
		
* 结构化伪类

	1、:first-child 和:last-child
	
	:first-child 代表一组同胞元素中的第一个元素，而:last-child 则代表最后一个。
	
	2、:nth-child
	
		e:nth-child(n)
	
	e 表示元素名，n 表示一个数值(也可以使用 odd 或 even)。
	
#####2-3-2.伪元素
顾名思义，伪元素就是你的文档中若有实无的元素。以下我们介绍几个最有用的伪 元素

1、::first-letter 伪元素

	p::first-letter {font-size:300%;}
	
段落首字符放大的效果。

2、::first-line 伪元素

	p::first-line {font-variant:small-caps;} 

可以把第一行以小型大写字母显示

3、::before 和::after 伪元素

	<p class="age">25</p>
	p.age::before {content:"Age: ";}
	p.age::after {content:" years.";}
	
	Age: 25 years.
	
	
##<a name="info"></a>参考
###1.网络资源
[css布局-dispaly,position,float](http://www.cnblogs.com/dolphinX/archive/2012/10/13/2722501.html)

[css布局-float详解，英文](https://css-tricks.com/all-about-floats/)

[css相对定位和绝对定位](https://segmentfault.com/a/1190000000680773)

[关于css position: absolute、relative定位问题](http://weibo.com/ttarticle/p/show?id=2309403986600882225385)

[HTML、CSS知识点总结，浅显易懂](http://www.tuicool.com/articles/nYr22qn)


###2.书籍相关
[css设计指南3](http://vdisk.weibo.com/s/7C37FWhg2OD?from=page_100505_profile&wvr=6)

###3.练手项目
[百度前端技术学院](http://ife.baidu.com/2016/task/all)
