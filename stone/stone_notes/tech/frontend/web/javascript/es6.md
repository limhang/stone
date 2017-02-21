# es6

引子：学习总结es6的基础知识

**目录**

> [块级作用域，let和const](#let&const) 
>
>
>
>
>
> [参考](#info)

## <a name="let&const"></a>块级作用域，let和const

###块级作用域
ES5只有全局作用域和函数作用域，没有块级作用域，这带来很多不合理的场景。

* 场景一，内层变量可能会覆盖外层变量。

```
var tmp = new Date();

function f() {
  console.log(tmp);
  if (false) {
    var tmp = "hello world";
  }
}
f(); // undefined

值为undefined的原因，可以参考变量提升部分，见下
```

* 场景二，用来计数的循环变量泄露为全局变量。

```
var s = 'hello';

for (var i = 0; i < s.length; i++) {
  console.log(s[i]);
}

console.log(i); // 5
```

###let与var的区别：

* 1.**不存在变量提升**，var命令会发生”变量提升“现象，即变量可以在声明之前使用，值为undefined。

eg:

```
// var 的情况
console.log(foo); // 输出undefined
var foo = 2;

// let 的情况
console.log(bar); // 报错ReferenceError
let bar = 2;
```

* 2.**不允许重复声明**，let不允许在相同作用域内，重复声明同一个变量。

eg:

```
// 报错
function () {
  let a = 10;
  var a = 1;
}

// 报错
function () {
  let a = 10;
  let a = 1;
}
```

* 3.let声明的变量，只在let命令所在的**代码块({})内有效**。

eg:

```
var a = [];
for (let i = 0; i < 10; i++) {
  a[i] = function () {
    console.log(i);
  };
}
a[6](); // 6

如果使用var，那个最后输出为10
```



## <a name="info"></a>参考
[es6入门指南](http://es6.ruanyifeng.com/#docs/let)
