function List() {
	this.listSize = 0;
	this.pos = 0;
	this.dataStore = [];
	this.clearList = clearList;
	this.find = find;
	this.toString = toString;
	this.insert = insert;
	this.append = append;
	this.remove = remove;
	// this.front = front;
	// this.end = end;
	// this.prev = prev;
	// this.nextElement = nextElement;
	// this.lengthList = List;
	// this.currPos = currPos;
	// this.moveTo = moveTo;
	// this.getElement = getElement;
}

function append(element) {
	this.dataStore[this.listSize++] = element;
}

function find(element) {
	for(var i = 0; i < this.dataStore.length; ++i) {
		if (this.dataStore[i] == element) {
			return i;
		}
	}
	return -1;
}

function remove(element) {
	var foundAt = this.find(element);
	if (foundAt > -1) {
		this.dataStore.splice(foundAt,1);
		--this.listSize;
		return true;
	}
	return false;
}

function lengthlist() {
	return this.listSize;
}

function toString() {
	return this.dataStore;
}

function insert(element,after) {
	var insertPos = this.find(after);
	if (insertPos > -1) {
		this.dataStore.splice(insertPos + 1,0,element);
		--this.listSize;
		return true;
	}
	return false;
}

function clearList() {
	delete this.dataStore;
	this.dataStore = [];
	this.pos = this.listSize = 0;
}


var names = new List();
names.append('jacob');
names.append('raistlin');
names.append('jetty');
names.append('bruce');
// print(names.toString());
console.log(names.toString());
names.remove('raistlin');
// print(names.toString());
console.log(names.toString());
names.insert('raist','bruce');
console.log(names.toString());
names.clearList();
console.log(names.toString());
