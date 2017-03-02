#javascript作用域（JavaScript Variable Scope and Hoisting Explained）
* 块级作用域 （es6才支持的）=>{}，在大括号内的就是块级作用域
* 函数作用域  =>就是在函数的实现中的，变量
* 全局作用域  =>在外部声明的变量，如果声明变量的时候，不添加var关键字，则都是全局作用域

本地作用域（函数作用域）的优先级高于全局作用域

【一】、在es6之前，块级作用域的一个常见认知错误，demo

	for (var i = 1; i <= 10; i++) {
		console.log (i); // outputs 1, 2, 3, 4, 5, 6, 7, 8, 9, 10;​
	};
	​
	​// The variable i is a global variable and it is accessible in the following function with the last value it was assigned above ​
	​function aNumber () {
	console.log(i);
	}
	​
	​// The variable i in the aNumber function below is the global variable i that was changed in the for loop above. Its last value was 11, set just before the for loop exited:​
	aNumber ();  // 11​
​
**解释：**在es6之前没有块级作用域这个概念，所以在块级作用域中声明的变量和赋值的变量，其实就是全局变量。


【二】、setTimeout Variables are Executed in the Global Scope

所有在setTimeout中执行的函数都是放在全局scope环境下执行的，DEMO：

	// The use of the "this" object inside the setTimeout function refers to the Window object, not to myObj​
	​
	​var highValue = 200;
	​var constantVal = 2;
	​var myObj = {
		highValue: 20,
		constantVal: 5,
		calculateIt: function () {
	 setTimeout (function  () {
		console.log(this.constantVal * this.highValue);
	}, 2000);
		}
	}
	​
	​// The "this" object in the setTimeout function used the global highValue and constantVal variables, because the reference to "this" in the setTimeout function refers to the global window object, not to the myObj object as we might expect.​
	​
	myObj.calculateIt(); // 400​
	​// This is an important point to remember.

##注意事项：
【一】、不要过多的声明全局变量

**wrong way**

	// These two variables are in the global scope and they shouldn't be here​
	​var firstName, lastName;
	​
	​function fullName () {
		console.log ("Full Name: " + firstName + " " + lastName );
	}

**right way**

	// Declare the variables inside the function where they are local variables​
	​
	​function fullName () {
		var firstName = "Michael", lastName = "Jackson";
	​
		console.log ("Full Name: " + firstName + " " + lastName );
	}


【二】、使用变量的时候，需要提前声明，虽然有声明提前的功能，但是建议不要这么做

	function showName () {
	console.log ("First Name: " + name);
	​var name = "Ford";
	console.log ("Last Name: " + name);
	}
	​
	showName (); 
	​// First Name: undefined​
	​// Last Name: Ford​
	​
	​// The reason undefined prints first is because the local variable name was hoisted to the top of the function​
	​// Which means it is this local variable that get calls the first time.​
	​// This is how the code is actually processed by the JavaScript engine:​
	​
	​function showName () {
		var name; // name is hoisted (note that is undefined at this point, since the assignment happens below)​
	console.log ("First Name: " + name); // First Name: undefined​
	​
	name = "Ford"; // name is assigned a value​
	​
	​// now name is Ford​
	console.log ("Last Name: " + name); // Last Name: Ford​
	}


[外文原稿](http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/)