function Stack(){
	this.dataStore = [];
	this.top = 0;
	this.push = push;
	this.pop = pop;
	this.peek = peek;
	this.length = length;
	this.clear = clear;
}

function push(element) {
	this.dataStore[top++] = element;
}

function pop() {
	return this.dataStore[--top];
}

function peek() {
	return this.dataStore[top - 1];
}

function length() {
	return this.top;
}

function clear() {
	this.top = 0;
}

var instanceStack = new Stack();
instanceStack.push('jacob');
instanceStack.push('jetty');
instanceStack.push('bruce');
instanceStack.push('raistlin');
console.log(instanceStack.peek());
instanceStack.pop();
console.log(instanceStack.peek());
instanceStack.pop();
console.log(instanceStack.peek());