###require文件和原文件之间的变量是否共享，如果在函数中require呢？
如果是在函数中require某个文件的话，那么require文件中的变量可在函数中被使用，require文件也可以使用函数作用域中的变量

如果是在文件中引用（函数外，文件全局），那么require文件可以使用原文件中的变量，原文件中的变量可以使用require文件中的变量。

###require_once和require，require和include
在stackflow上看到的解释是：

require_once和require的区别是require_once会去检查看是不是源码对某一文件只引用了一次，而require不会去检查，当然require更快些，如果清楚自己没有重复引用可以直接使用require，小项目还是直接用require_once吧

require条件更加苛刻，如果没有这个文件的话，编译通不过，但是include只是会有一个警告

###&操作符号

[变量和函数的引用传值](http://www.cnblogs.com/thinksasa/p/3334492.html)