# python框架相关
引子：主要收集记录，python的框架模板之类的信息，便于以后查找

**目录**

> [1、requests](#no1)
>
> [2、lxml](#no2)
>
>
>


## <a name="no1"></a>1、requests
Passing Parameters In URLs

```
	>>> payload = {'key1': 'value1', 'key2': 'value2'}
	>>> r = requests.get('http://httpbin.org/get', params=payload)
	>>> print(r.url)
	
	http://httpbin.org/get?key2=value2&key1=value1
```	

Response Content

```
	>>> import requests

	>>> r = requests.get('https://api.github.com/events')
	>>> r.text
	u'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

Binary Response Content

```
	>>> r.content
	b'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

eg:

	>>> from PIL import Image
	>>> from io import BytesIO

	>>> i = Image.open(BytesIO(r.content))

[更多请参考](http://docs.python-requests.org/en/latest/user/quickstart/)



## <a name="no2"></a>2、lxml

[英文资料](http://lxml.de/tutorial.html#the-xml-function)

[中文参考](http://cuiqingcai.com/2621.html)