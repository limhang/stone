#es6学习笔记
缘由：es6的书籍从来还没有系统的看过，这几天系统看看es6吧

目录：
> [一、let和const命令](#section1)
>
> [二、常量的解构赋值](#section2)
>
>
>
>

##<a name="section1"></a>一、let和const命令
###1-1、块级作用域
在es6之前js是没有块级作用域的，es6之后，js引入块级作用域

使用let申明变量的时候就有隐形的块级作用域，使用const定义常量也有块级作用域

具体的细节我在《你不知道的js》学习笔记中已经写过了

##<a name="section2"></a>二、常量的解构赋值
###2-1、数组的解构赋值
本质上，这种写法属于“模式匹配”，只要等号两边的模式相同，左边的变量就会被赋予对应的值。下面是一些使用嵌套数组进行解构的例子。

```
let [foo, [[bar], baz]] = [1, [[2], 3]];
foo // 1
bar // 2
baz // 3

let [ , , third] = ["foo", "bar", "baz"];
third // "baz"

let [x, , y] = [1, 2, 3];
x // 1
y // 3

let [head, ...tail] = [1, 2, 3, 4];
head // 1
tail // [2, 3, 4]

let [x, y, ...z] = ['a'];
x // "a"
y // undefined
z // []
```

###2-2、对象的解构赋值
对象的解构与数组有一个重要的不同。数组的元素是按次序排列的，变量的取值由它的位置决定；而对象的属性没有次序，变量必须与属性同名，才能取到正确的值。

```
let { bar, foo } = { foo: "aaa", bar: "bbb" };
foo // "aaa"
bar // "bbb"

let { baz } = { foo: "aaa", bar: "bbb" };
baz // undefined
```

###2-3、字符串的解构赋值
字符串也可以解构赋值。这是因为此时，字符串被转换成了一个类似数组的对象。

```
const [a, b, c, d, e] = 'hello';
a // "h"
b // "e"
c // "l"
d // "l"
e // "o"
```

###2-4、数值和布尔值的解构赋值
解构赋值时，如果等号右边是数值和布尔值，则会先转为对象。

```
let {toString: s} = 123;
s === Number.prototype.toString // true

let {toString: s} = true;
s === Boolean.prototype.toString // true
```

###2-5、函数参数的解构赋值
```
[[1, 2], [3, 4]].map(([a, b]) => a + b);
// [ 3, 7 ]
```

```
function add([x, y]){
  return x + y;
}

add([1, 2]); // 3
```

