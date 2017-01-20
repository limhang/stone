// bubble排序
// 可视化演示过程可参考：https://visualgo.net/sorting
// 理解：时间复杂度为O(n2);进行2个for循环，原则是每一个子循环进行后，最大数值被放置最右侧
function bubbleSort() {
	var numElements = this.dataStore.length;
	var temp;
	for (var outer = numElements.length; outer >=2; --outer) {
		for (var inner = 0; inner <= outer - 1; ++inner) {
			if (this.dataStore[inner] > this.dataStore[inner + 1]) {
				swap(this.dataStore,inner,inner + 1);
			}
		}
	}
}