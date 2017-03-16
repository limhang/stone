# ajax使用



以下代码是coderhelper中data_analysis中初始使用的代码：



```
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="echarts.min.js"></script>
        <script>
            function loadXMLDoc()
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // IE6, IE5 浏览器执行代码
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                        var json = xmlhttp.responseText;
                        console.log(json);
                    }
                }
                xmlhttp.open("GET","sql_ctrl.php",true);
                xmlhttp.send();
            }
        </script>






</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->

    <div id="myDiv"><h2>使用 AJAX 修改该文本内容</h2></div>
    <button type="button" onclick="loadXMLDoc()">修改内容</button>
    <div id="main" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        option = {
            title : {
                text: '某地区蒸发量和降水量',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['蒸发量','降水量']
            },
//            toolbox: {
//                show : true,
//                feature : {
//                    dataView : {show: true, readOnly: false},
//                    magicType : {show: true, type: ['line', 'bar']},
//                    restore : {show: true},
//                    saveAsImage : {show: true}
//                }
//            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                }
            ],
            yAxis : [
                {
                    type : 'value',
                }
            ],
            series : [
                {
                    name:'蒸发量',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 432.2, 32.6, 20.0, 6.4, 3.3]
//                    markPoint : {
//                        data : [
//                            {type : 'max', name: '最大值'},
//                            {type : 'min', name: '最小值'}
//                        ]
//                    },
//                    markLine : {
//                        data : [
//                            {type : 'average', name: '平均值'}
//                        ]
//                    }
                },
                {
                    name:'降水量',
                    type:'bar',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                    // markPoint : {
                    //     data : [
                    //         {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                    //         {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                    //     ]
                    // }
//                    markLine : {
//                        data : [
//                            {type : 'average', name : '平均值'}
//                        ]
//                    }
                }
            ]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>

​```
```



