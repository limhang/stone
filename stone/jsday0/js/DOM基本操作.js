function g(id) {
	return document.getElementById(id);
}

var apiData = [];
var sublime = document.getElementById('sublime');

// 提交成熟数据
sublime.onclick = function(){
	var city = g('city-input').value;
	var num = g('danger-num').value;
	apiData[city] = num;
}

// 生成table数据
sublime.onblur = function(){
	var table = g('show-table');
	var title_tr = document.createElement('tr');
	var title_th1 = document.createElement('th');
	var title_th2 = document.createElement('th');
	var title_th3 = document.createElement('th');
	table.appendChild(title_tr);
	title_tr.appendChild(title_th1);
	title_tr.appendChild(title_th2);
	title_tr.appendChild(title_th3);
	var title_th1_name = document.createTextNode('城市');
	var title_th2_name = document.createTextNode('污染');
	title_th1.appendChild(title_th1_name);
	title_th2.appendChild(title_th2_name);
	//根据数据刷新视图
	for (city_name in apiData) {
		var city = city_name;
		var num = apiData[city_name];
		var content_tr = document.createElement('tr');
		var content_td1 = document.createElement('td');
		var content_td2 = document.createElement('td');
		var content_td3 = document.createElement('td');
		table.appendChild(content_tr);
		content_tr.appendChild(content_td1);
		content_tr.appendChild(content_td2);
		content_tr.appendChild(content_td3);
		var content_td1_name = document.createTextNode(city);
		var content_td2_name = document.createTextNode(num);
		content_td1.appendChild(content_td1_name);
		content_td2.appendChild(content_td2_name);
	}

}