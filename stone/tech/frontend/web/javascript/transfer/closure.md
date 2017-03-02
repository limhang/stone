# Understand JavaScript Closures With Ease

【一】、闭包的基本概念
闭包就是内部函数获取外部函数的变量（来自scope chain），闭包有3中scope chain，一种是自身的作用域，还有一种是外部函数的作用域，最后是全局的作用域。

闭包（inner function）不仅可以获取外部函数（outer function）的变量还可以获取外部函数的参数。

最简单的闭包如下：

	function showName (firstName, lastName) { 
	​var nameIntro = "Your name is ";
	    // this inner function has access to the outer function's variables, including the parameter​
	​function makeFullName () {         
	​return nameIntro + firstName + " " + lastName;     
	}
	​
	​return makeFullName (); 
	} 
	​
	showName ("Michael", "Jackson"); // Your name is Michael Jackson
	
 【二】、闭包的规则和副作用

1、闭包可以获取外部函数的变量，即使外部函数调用完成（就是执行完成）后。

	function celebrityName (firstName) {
	    var nameIntro = "This celebrity is ";
	    // this inner function has access to the outer function's variables, including the parameter​
	   function lastName (theLastName) {
	        return nameIntro + firstName + " " + theLastName;
	    }
	    return lastName;
	}
	​
	​var mjName = celebrityName ("Michael"); // At this juncture, the celebrityName outer function has returned.​
	​
	​// The closure (lastName) is called here after the outer function has returned above​
	​// Yet, the closure still has access to the outer function's variables and parameter​
	mjName ("Jackson"); // This celebrity is Michael Jackson 
2、闭包获取的外部函数的变量值，会实时改变（不好翻译，看原文吧）

Closures store references to the outer function’s variables; they do not store the actual value.  Closures get more interesting when the value of the outer function’s variable changes before the closure is called. And this powerful feature can be harnessed in creative ways, such as this private variables example first demonstrated by Douglas Crockford: 

	function celebrityID () {
	    var celebrityID = 999;
	    // We are returning an object with some inner functions​
	    // All the inner functions have access to the outer function's variables​
	    return {
	        getID: function ()  {
	            // This inner function will return the UPDATED celebrityID variable​
	            // It will return the current value of celebrityID, even after the changeTheID function changes it​
	          return celebrityID;
	        },
	        setID: function (theNewID)  {
	            // This inner function will change the outer function's variable anytime​
	            celebrityID = theNewID;
	        }
	    }
	​
	}
	​
	​var mjID = celebrityID (); // At this juncture, the celebrityID outer function has returned.​
	mjID.getID(); // 999​
	mjID.setID(567); // Changes the outer function's variable​
	mjID.getID(); // 567: It returns the updated celebrityId variable 
3、最常见的循环导致闭包出的bug，需要结合2来看，因为闭包获取的外部函数的变量会实时改变

这个例子需要仔细看，其实就是结合了例子1和例子2，最后形成的一个套路

	// This example is explained in detail below (just after this code box).​
	​function celebrityIDCreator (theCelebrities) {
	    var i;
	    var uniqueID = 100;
	    for (i = 0; i < theCelebrities.length; i++) {
	      theCelebrities[i]["id"] = function ()  {
	        return uniqueID + i;
	      }
	    }
	    
	    return theCelebrities;
	}
	​
	​var actionCelebs = [{name:"Stallone", id:0}, {name:"Cruise", id:0}, {name:"Willis", id:0}];
	​
	​var createIdForActionCelebs = celebrityIDCreator (actionCelebs);
	​
	​var stalloneID = createIdForActionCelebs [0];  console.log(stalloneID.id()); // 103


**解决办法：**核心就是使用立即执行函数，这样返回的就不是一个函数了，而是执行完成的结果

	function celebrityIDCreator (theCelebrities) {
	    var i;
	    var uniqueID = 100;
	    for (i = 0; i < theCelebrities.length; i++) {
	        theCelebrities[i]["id"] = function (j)  { // the j parametric variable is the i passed in on invocation of this IIFE​
	            return function () {
	                return uniqueID + j; // each iteration of the for loop passes the current value of i into this IIFE and it saves the correct value to the array​
	            } () // BY adding () at the end of this function, we are executing it immediately and returning just the value of uniqueID + j, instead of returning a function.​
	        } (i); // immediately invoke the function passing the i variable as a parameter​
	    }
	​
	    return theCelebrities;
	}
	​
	​var actionCelebs = [{name:"Stallone", id:0}, {name:"Cruise", id:0}, {name:"Willis", id:0}];
	​
	​var createIdForActionCelebs = celebrityIDCreator (actionCelebs);
	​
	​var stalloneID = createIdForActionCelebs [0];
	 console.log(stalloneID.id); // 100​
	​
	​var cruiseID = createIdForActionCelebs [1]; console.log(cruiseID.id); // 101