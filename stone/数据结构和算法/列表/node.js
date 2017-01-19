function Node(element) {
	this.element = element;
	this.next = null;
}

function LList() {
	this.head = new Node('head');
	this.find = find;
	this.insert = insert;
	// this.remove = remove;
	this.display = display;
}

function find(item) {
	var currentNode = this.head;
	while (currentNode.element != item) {
		currentNode = currentNode.next;
	}
	return currentNode;
}

function insert(newElement,item) {
	var newNode = new Node(newElement);
	var currentNode = this.find(item);
	newNode.next = currentNode.next;
	currentNode.next = newNode;
}

function display() {
	var currentNode = this.head;
	while (!(currentNode.next == null)) {
		console.log(currentNode.element);
		currentNode = currentNode.next;
	}
}

var names = new LList();
names.insert('jacob','head');
names.insert('jetty','jacob');
names.insert('raistlin','jetty');
names.display();