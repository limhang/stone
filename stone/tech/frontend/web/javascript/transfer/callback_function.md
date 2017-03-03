#callback function
在javascript语法中，函数即使对象，就像String,Array,Number等其他对象一样。所以:

function可以被赋值给变量，可以作为函数的参数进行传递，可以在函数内创建新的function，可以被函数作为返回值，这些情况其实就是回调函数。

因为函数是first-class对象，我们可以将其作为参数传递给其他函数，然后在该函数内部执行传递进去的函数，也可以将其作为返回值，然后在执行该返回值函数。



【一】、常见的回调函数

	var friends = ["Mike", "Stacy", "Andy", "Rick"];
	​
	friends.forEach(function (eachName, index){
	console.log(index + 1 + ". " + eachName); // 1. Mike, 2. Stacy, 3. Andy, 4. Rick​
	});

【二】、实现回调函数基本的准则

1、Use Named OR Anonymous Functions as Callbacks

	 	// global variable​
	​var allUserData = [];
	​
	​// generic logStuff function that prints to console​
	​function logStuff (userData) {
	    if ( typeof userData === "string")
	    {
	        console.log(userData);
	    }
	    else if ( typeof userData === "object")
	    {
	        for (var item in userData) {
	            console.log(item + ": " + userData[item]);
	        }
	​
	    }
	​
	}
	​
	​// A function that takes two parameters, the last one a callback function​
	​function getInput (options, callback) {
	    allUserData.push (options);
	    callback (options);
	​
	}
	​
	​// When we call the getInput function, we pass logStuff as a parameter.​
	​// So logStuff will be the function that will called back (or executed) inside the getInput function​
	getInput ({name:"Rich", speciality:"JavaScript"}, logStuff);
	​//  name: Rich​
	​// speciality: JavaScript


2、Make Sure Callback is a Function Before Executing It


	function getInput(options, callback) {
	    allUserData.push(options);
	​
	    // Make sure the callback is a function​
	    if (typeof callback === "function") {
	    // Call it, since we have confirmed it is callable​
	        callback(options);
	    }
	}

	
3、Problem When Using Methods With The this Object as Callbacks


	// Define an object with some properties and a method​
	​// We will later pass the method as a callback function to another function​
	​var clientData = {
	    id: 094545,
	    fullName: "Not Set",
	    // setUserName is a method on the clientData object​
	    setUserName: function (firstName, lastName)  {
	        // this refers to the fullName property in this object​
	      this.fullName = firstName + " " + lastName;
	    }
	}
	​
	​function getUserInput(firstName, lastName, callback)  {
	    // Do other stuff to validate firstName/lastName here​
	​
	    // Now save the names​
	    callback (firstName, lastName);
	}

	getUserInput ("Barack", "Obama", clientData.setUserName);
	​
	console.log (clientData.fullName);// Not Set​
	​
	​// The fullName property was initialized on the window object​
	console.log (window.fullName); // Barack Obama


Use the Call or Apply Function To Preserve this

	//Note that we have added an extra parameter for the callback object, called "callbackObj"​
	​function getUserInput(firstName, lastName, callback, callbackObj)  {
	    // Do other stuff to validate name here​
	​
	    // The use of the Apply function below will set the this object to be callbackObj​
	    callback.apply (callbackObj, [firstName, lastName]);
	}
		
	// We pass the clientData.setUserName method and the clientData object as parameters. The clientData object will be used by the Apply function to set the this object​
	 getUserInput ("Barack", "Obama", clientData.setUserName, clientData);
	​
	​// the fullName property on the clientData was correctly set​
	console.log (clientData.fullName); // Barack Obama
	
	
[译文参考](http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/)