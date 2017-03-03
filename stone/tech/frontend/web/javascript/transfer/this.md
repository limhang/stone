#this的4种用法

函数中this到底取何种值，是在函数真正被调用执行的时候确定的，函数定义的时候确定不了

【一】、构造函数

	Function Foo() {
		this.name = "xxx";
		this.year = 1988;
		console.log(this);
	}
	
	var f1 = new Foo();
	console.log(f1.name);
	console.log(f1.year);
	
上述中，如果函数用作构造函数使用，那么this就是new出来的对象。

	Function Foo() {
		this.name = "xxx";
		this.year = 1988;
		console.log(this);
	}
	Foo();
	
这种情况下this就是window

【二】、函数作为对象的一个属性

如果函数作为对象的一个属性时，并且作为对象的一个属性被调用时，函数中的this指向该对象。

	var obj = {
		x : 10,
		fn : function() {
			console.log(this);
			console.log(this.x);
		}
	}
	
	obj.fn();
	
以上代码中，fn不仅作为对象的一个属性，而且确实作为对象的属性调用，那么this指向obj对象
	
	var obj = {
		x : 10,
		fn : function() {
			console.log(this);
			console.log(this.x);
		}
	}
	
	var fn1 = obj.fn();
	fn1();
	
上面代码中如果将对象的属性赋值给另一个变量，则该新的函数中的this指向window


[参考](http://www.cnblogs.com/wangfupeng1988/p/3988422.html)
	