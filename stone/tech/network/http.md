#图解HTTP学习笔记

缘由：一开始的时候一直都未对http做过太多研究，只是将就够用，但是在写爬虫，被人反爬虫之后，发现不能熟悉掌握http协议，将在互联网世界举步维艰。

目录：

> [一、了解web及网络基础](#section1)
>
> [二、HTTP报文内的信息](#section2)
>
>
>

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
###1-1、HTTP报文
用于HTTP协议交互的信息
