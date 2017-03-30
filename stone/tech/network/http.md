#图解HTTP学习笔记

缘由：一开始的时候一直都未对http做过太多研究，只是将就够用，但是在写爬虫，被人反爬虫之后，发现不能熟悉掌握http协议，将在互联网世界举步维艰。

目录：

> [一、了解web及网络基础](#section1)
>
> [二、HTTP报文内的信息](#section2)
>
> [三、HTTP首部字段](#section3)
>
> [四、HTTPS协议](#section4)
> 
> [五、确认访客的身份认证](#section5)
> 
> [六、网站安全](#section6)

##<a name="section1"></a>一、了解web及网络基础

###1-1、URI(统一资源标识符)
URL(统一资源定位符)，我们比较熟悉，URI是3个单词的缩写，Uniform Resource Identifier

URI用字符串表示某一互联网资源，而URL表示资源的地点，可见URL是URI的子集；采用HTTP协议时，协议方案就是http，除此之外，还有ftp、file等，标准的URI协议有30种方案左右。

![URI的基本格式](http://ok2nitkry.bkt.clouddn.com/http01.png)

登录信息：指定用户名和密码作为从服务器端获取资源时必要的登录信息（身份认证），可选项。

查询字符串：针对已指定的文件路径内的资源，可以使用查询字符串传入任意参数，可选项。

片段标识符：使用片段标识符通常可标识出已获取资源中的子资源，可选项。

###1-2、HTTP协议基本规定
**一、HTTP发送规则：**HTTP协议规定，请求从客户端发出，最后服务器端响应该请求并返回，换句话说，服务器端在没有收到请求的时候，不会发送响应，所以肯定是从客户端开始建立通信的。

**二、HTTP无状态：**HTTP是一种不保存状态，即无状态协议，不会对之前发送过的请求进行信息的保存。这样做的好处是可以快速处理大量事务。但是随着网络的不断发展，这种无状态的模式，出现了瓶颈，比如购物网站需要保持用户的登录状态，这样服务器才能知道是谁发送的请求。**虽然HTTP1.1是无状态的协议，但是使用了cookie技术，可以保存用户的登录状态**

###1-3、使用方法下达命令
![get、post和head方法介绍](http://ok2nitkry.bkt.clouddn.com/http02.png)

###1-4、HTTP持久化链接
在HTTP协议的初期版本中，每进行一次HTTP通信都要断开一次tcp链接，在早些时候，传输的都是文本类信息，但是目前请求都是含有大量图片的信息，这样tcp的不断断开重连会造成很大的开销。

为了解决上述tcp链接的问题，HTTP1.1和部分HTTP1.0相出了持久连接（HTTP keep-alive）的方法，持久化链接的特点是：只要任意一端没有明确提出断开链接，则保持TCP链接状态。http1.1默认都支持keep-alive

###1-5、cookie的状态管理
cookie会根据服务端发送的一个叫做Set-Cookie的首部字段信息，通知客服端保存Cookie，当下次客服端在往服务端发送请求的时候，客服端会自动在请求报文中加入Cookie然后发送过去，服务端接收到Cookie之后，对Cookie进行解析，然后找出是哪个用户。

**eg:**

一、请求报文（没有Cookie信息的状态）

```
GET /reader/HTTP/1.1
Host:hackr.jp
*首部字段没有cookie的相关信息
```

二、响应报文（服务器端生成Cookie信息）

```
HTTP/1.1 200 OK
Date:Thu ,12 JUl 2012 07:12:20 GMT
Server: Apache
<Set-Cookie:sid=1342077140;path=/;expires=wed>
Content-Type:text/plain;charset=UTF-8
```

三、请求报文（自动发送保存的Cookie信息）

```
GET /image/ HTTP/1.1
Host hackr.jp
Cookie:sid=1342077140
```

##<a name="section2"></a>二、HTTP报文内的信息
###2-1、HTTP报文
用于HTTP协议交互的信息

![请求报文和响应报文结构](http://ok2nitkry.bkt.clouddn.com/http03.png)

![请求报文和响应报文实例](http://ok2nitkry.bkt.clouddn.com/http04.png)

请求行：包含用于请求的方法，请求的URI和HTTP版本

状态行：包含表明响应结果的状态码，原因短语和HTTP版本

首部字段：包含表示请求和响应的各种条件和属性的各类首部，一般有4中首部，通用首部，请求首部，响应首部，实体首部。

###2-2、编码提升传输效率
常用的内容编码有这几种:

* gzip (GNU zip)
* compress (UNIX 系统的标准压缩)
* deflate (zlib)
* identity (不进行编码)

###2-3、分割发送的分块传输编码
在传输大容量数据的时候，经常采用分块传输的方式

###2-4、发送多种数据的多部分对象集合
例如在写邮件的时候，可以在邮件中插入音频和视频，还有文字多种不同类型的数据，这个时候就需要用到多种数据的多部分对象集合发送

###2-5、获取指定范围的请求数据
例如在下载电影的时候，突然断网了，之前是需要重新下载的，但是可以使用Range: bytes=5001-，从5001字节之后开始下载

###2-6、内容协商，返回最合适的内容
同一个网站，有多份内容相同的页面，比如中文和英文，虽然内容是一样的，但是使用的语言不同，这个时候需用内容协商。Accept，Accept-Charset等等

##<a name="section3"></a>三、HTTP首部字段
![通用首部字段](http://ok2nitkry.bkt.clouddn.com/http05.jpg)

![请求首部字段](http://ok2nitkry.bkt.clouddn.com/http06.jpg)

![响应首部字段](http://ok2nitkry.bkt.clouddn.com/http07.jpg)

![实体首部字段](http://ok2nitkry.bkt.clouddn.com/http08.jpg)

##<a name="section4"></a>四、HTTPS协议
##4-1、HTTPS协议介绍
http协议未对信息进行加密，所以需要采用加密的形式进行传输，常用的加密方法有：ssl,tls，（secure socket layer）(transport layer security)，在http协议上使用ssl就是https协议。

##4-2、不验证通信方的身份可能遇到身份伪装
http通信不会进行身份的确认，所以可能出现双方身份的伪装，比如客户端使用URI访问服务器的时候，响应的数据一定是指定的服务器发出的数据嘛？服务器发送给客服端，一定是指定的客户端嘛？

比如常见的DoS攻击，就算是无意义的请求，也会响应。

ssl不仅可以加密信息，还有身份验证的作用（证书验证）

##4-3、信息完整性
收到的信息，可能被人为篡改，http无法证明通信的完整性。像这种，在响应传输的过程中发起的攻击，称为中间人攻击（man in the middle attack,MITM）

常用的http协议为了保证信息完整性，一般采用MD5或者证书签名，但是当签名证书和md5信息被人篡改，则无法保证信息完整性。

##4-4、HTTP+加密+认证+信息完整性=HTTPS
![https和http的关系](http://ok2nitkry.bkt.clouddn.com/http09.png)


##<a name="section5"></a>五、确认访客的身份确认
http使用的身份认证：

* BASIC认证（基本认证）--服务端放回401说明需要认证，然后输入用户名和密码，使用base64加密，发送给服务端，然后进行身份认证。
* DIGEST认证（摘要认证）--服务端发送随机数，客户端发送摘要和计算结果。
* SSL客服端认证
* FormBase认证（基于表单认证）

由于使用上的便利性和安全性的问题，http协议标准提供的basic认证和digest认证几乎不怎么使用，另外ssl使用成本高，一般使用基于表单认证。

###5-1、基于表单认证
基于表单的认证标准规范尚未有定论，一般会使用cookie管理session（会话）

![cookie管理session](http://ok2nitkry.bkt.clouddn.com/http10.png)

##<a name="section6"></a>六、网站安全
###5-1、跨站脚本攻击



###5-2、SQL脚本注入攻击

