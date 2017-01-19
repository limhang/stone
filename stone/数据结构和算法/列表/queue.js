function Queue() {
	this.dataStore = [];
	this.enqueue = enqueue;
	this.dequeue = dequeue;
	this.front = front;
	this.back = back;
	this.toString = toString;
	this.empty = empty;
}

function enqueue(element) {
	this.dataStore.push(element);
}

function dequeue () {
	return this.dataStore.shift();
}

function front () {
	return this.dataStore[0];
}

function back () {
	return this.dataStore[this.dataStore.length - 1];
}

function toString() {
	var restr = '';
	for (var i = 0; i < this.dataStore.length; i++) {
		restr += this.dataStore[i] + '\n';
	}
	return restr;
}

function empty () {
	if (this.dataStore.length == 0) {
		return true;
	} else {
		return false;
	}
}

var queue = new Queue();
queue.enqueue('jacob');
queue.enqueue('bruce');
queue.enqueue('jetty');
console.log(queue.front());
console.log(queue.back());
console.log(queue.toString());
queue.dequeue();
console.log(queue.toString());
