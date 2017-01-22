#网络基础
引子：网络通信中很多概念，比较容易弄混，一直没有系统整理过，在此，归纳网络通信中基本的概念和术语

**目录**
> [通信协议介绍](#protocal)
>
> [Http与Https介绍](#http-https)
> 
> [socket介绍](#socket)
> 
> [websocket介绍](#websocket)
> 
> [tcp/ip介绍](#tcp-ip)
> 
> [DNS,网关，反向代理，隧道](#dns)
> 
> [应用：搭建翻墙服务器](#vpn)
> 
> [应用：多人在线聊天](#chat)
> 
> [参考](#info)

##<a name="protocal"></a>通信7层，5层协议
###七层通信协议
* 应用层 --文件传输，电子邮件，文件下载上传等服务，HTTP,FTP,SMTP，DNS等
* 表示层 --数据格式化，代码转换，数据加密，没有协议
* 会话层 --解除或建立与别的接点的联系，没有协议
* 传输层 --提供端对端的接口，TCP，UDP
* 网络层 --为数据包选择路由 IP协议等
* 数据链路层
* 物理层

###五层通信协议
七层协议比较复杂，所以后续推出五层协议

* 应用层
* 传输层
* 网络层
* 数据链路层
* 物理层


##<a name="http-https"></a>http与https
###http简介
http协议属于应用层的协议，用于web端和服务器端的数据交互和通信。
HTTP有1.1和1.0之说，也就是所谓的keep-alive，把多个HTTP请求合并为一个，但是Websocket其实是一个新协议，跟HTTP协议基本没有关系，只是为了兼容现有浏览器的握手规范而已，也就是说它是HTTP协议上的一种补充。

Keep-Alive是通知服务器，在这个HTTP Request/Responset结束后，不要立即断开TCP连接（注意是TCP连接，和HTTP没有关系），后面的HTTP Request仍然可以通过这个TCP连接继续传送。

但是！这只是个建议，服务器可能不支持，也可能忽略掉这个建议。也可能因为时间太久而直接断开TCP连接，下图展示了http几种不同链接：

![http几种不同链接](http://ok2nitkry.bkt.clouddn.com/http%E5%87%A0%E7%A7%8D%E4%B8%8D%E5%90%8C%E9%93%BE%E6%8E%A5.png)


##<a name="socket"></a>socket
socket中文也译作套字节，是TCP/UDP通信协议的一层封装，这样让开发者，可以更快捷的使用tcp协议。

Socket 是电脑网络中进程间数据流的端点，也是传输层网络通信的 API。HTTP 作为一个应用层的协议，一般是基于传输层的 TCP 协议的。因此我们要在 TCP 协议上构建我们的程序，也就是使用 Socket 传输 HTTP 的消息。

下图展示了Socket TCP 通信的步骤：

![socket建链](http://ok2nitkry.bkt.clouddn.com/socket%E5%BB%BA%E9%93%BE.png)

##<a name="websocket"></a>websocket
WebSocket是HTML5出的东西（协议），也就是说HTTP协议没有变化，或者说没关系，但HTTP是不支持持久连接的（长连接，循环连接的不算）

###Websocket是什么样的协议，具体有什么优点
首先，Websocket是一个**持久化**的协议，相对于HTTP这种**非持久**的协议来说。

简单的举个例子吧，用目前应用比较广泛的生命周期来解释。

* HTTP的生命周期通过Request来界定，也就是一个Request 一个Response，那么在HTTP1.0中，这次HTTP请求就结束了。
* 在HTTP1.1中进行了改进，使得有一个keep-alive，也就是说，在一个HTTP连接中，可以发送多个Request，接收多个Response。（但是服务器端，支不支持，这个看服务器端，节省建立tcp连接的成本）
* 但是请记住 Request = Response，在HTTP中永远是这样，也就是说一个request只能有一个response。而且这个response也是**被动**的，不能主动发起。

其次，Websocket是基于HTTP协议的，或者说**借用**了HTTP的协议来完成一部分握手


###Websocket的作用，与HTTP的长轮询和ajax的比较
在讲Websocket之前，我就顺带着讲下 long poll 和 ajax轮询 的原理。

ajax轮询 ，ajax轮询 的原理非常简单，让浏览器隔个几秒就发送一次请求，询问服务器是否有新信息。

场景再现：

* 客户端：啦啦啦，有没有新信息(Request)
* 服务端：没有（Response）
* 客户端：啦啦啦，有没有新信息(Request)
* 服务端：没有。。（Response）
* 客户端：啦啦啦，有没有新信息(Request)
* 服务端：你好烦啊，没有啊。。（Response）
* 客户端：啦啦啦，有没有新消息（Request）
* 服务端：好啦好啦，有啦给你。（Response）
* 客户端：啦啦啦，有没有新消息（Request）
* 服务端：。。。。。没。。。。没。。。没有（Response） ---- loop

long poll 

long poll 其实原理跟 ajax轮询 差不多，都是采用轮询的方式，不过采取的是阻塞模型（一直打电话，没收到就不挂电话），也就是说，客户端发起连接后，如果没消息，就一直不返回Response给客户端。直到有消息才返回，返回完之后，客户端再次建立连接，周而复始。

场景再现

* 客户端：啦啦啦，有没有新信息，没有的话就等有了才返回给我吧（Request）
* 服务端：额。。 等待到有消息的时候。。来 给你（Response）
* 客户端：啦啦啦，有没有新信息，没有的话就等有了才返回给我吧（Request） -loop

从上面可以看出其实这两种方式，都是在不断地建立HTTP连接，然后等待服务端处理，可以体现HTTP协议的另外一个特点，被动性。

说完这个，我们再来说一说上面的缺陷
从上面很容易看出来，不管怎么样，上面这两种都是非常消耗资源的。
ajax轮询 需要服务器有很快的处理速度和资源。（速度）
long poll 需要有很高的并发，也就是说同时接待客户的能力。（场地大小）
所以ajax轮询 和long poll 都有可能发生这种情况。

* 客户端：啦啦啦啦，有新信息么？
* 服务端：月线正忙，请稍后再试（503 Server Unavailable）
* 客户端：。。。。好吧，啦啦啦，有新信息么？
* 服务端：月线正忙，请稍后再试（503 Server Unavailable）

所以在这种情况下出现了，Websocket出现了。

他解决了HTTP的这几个难题。

首先，被动性，当服务器完成协议升级后（HTTP->Websocket），服务端就可以主动推送信息给客户端啦。

所以上面的情景可以做如下修改。

* 客户端：啦啦啦，我要建立Websocket协议，需要的服务：chat，Websocket协议版本：17（HTTP Request）
* 服务端：ok，确认，已升级为Websocket协议（HTTP Protocols Switched）
* 客户端：麻烦你有信息的时候推送给我噢。。
* 服务端：ok，有的时候会告诉你的。
* 服务端：balabalabalabala
* 服务端：balabalabalabala
* 服务端：哈哈哈哈哈啊哈哈哈哈
* 服务端：笑死我了哈哈哈哈哈哈哈

就变成了这样，只需要经过一次HTTP请求，就可以做到源源不断的信息传送了。


##<a name="tcp-ip"></a>tcp/ip
tcp建连需要通过3次握手协议，具体图解：

![tcp三次握手](http://ok2nitkry.bkt.clouddn.com/tcp%E4%B8%89%E6%AC%A1%E6%8F%A1%E6%89%8B.jpg)

在TCP/IP协议中，TCP协议提供可靠的连接服务，采用三次握手建立一个连接。 

第一次握手：建立连接时，客户端发送syn包(syn=j)到服务器，并进入SYN_SEND状态，等待服务器确认； 

第二次握手：服务器收到syn包，必须确认客户的SYN（ack=j+1），同时自己也发送一个SYN包（syn=k），即SYN+ACK包，此时服务器进入SYN_RECV状态； 

第三次握手：客户端收到服务器的SYN＋ACK包，向服务器发送确认包ACK(ack=k+1)，此包发送完毕，客户端和服务器进入ESTABLISHED状态，完成三次握手。 完成三次握手，客户端与服务器开始传送数据.

eg:

IP 192.168.1.116.3337 > 192.168.1.123.7788: S 3626544836:3626544836

IP 192.168.1.123.7788 > 192.168.1.116.3337: S 1739326486:1739326486 ack 3626544837

IP 192.168.1.116.3337 > 192.168.1.123.7788: ack 1739326487,ack 1

第一次握手：192.168.1.116发送位码syn＝1,随机产生seq number=3626544836的数据包到192.168.1.123,192.168.1.123由SYN=1知道192.168.1.116要求建立联机;

第二次握手：192.168.1.123收到请求后要确认联机信息，向192.168.1.116发送ack number=3626544837,syn=1,ack=1,随机产生seq=1739326486的包;

第三次握手：192.168.1.116收到后检查ack number是否正确，即第一次发送的seq number+1,以及位码ack是否为1，若正确，192.168.1.116会再发送ack number=1739326487,ack=1，192.168.1.123收到后确认seq=seq+1,ack=1则连接建立成功。

##<a name="dns"></a>反向代理，隧道，网关，DNS


##<a name="vpn"></a>应用：搭建翻墙服务器（vpn,vps,虚拟主机）


##<a name="chat"></a>应用：搭建web端多人在线聊天室


##<a name="info"></a>参考

《图解http》

《tcp/ip协议详解-卷一》

[个人知乎网络相关收藏](https://www.zhihu.com/collection/136973687)

[websocket解释 知乎用户：Ovear](https://www.zhihu.com/question/20215561)

[http-socket解释 知乎用户：冯昱尧](https://www.zhihu.com/collection/136973687)

[tcp解释](http://www.cnblogs.com/rosesmall/archive/2012/04/09/2439726.html)
