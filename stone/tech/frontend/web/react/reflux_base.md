#reflux(v6.4.1)基本使用
缘由：写项目的时候需要用到这个第三方，故在这里总结一下

目录：
> [一、简介](#section1)
>
> [二、基本组件介绍](#section2)
>
> [三、使用demo](#section3)
> 
> [四、遇到的问题](#section4)

##<a name="section1"></a>一、简介
reflux是一种前端代码分离整合框架结构，基本的数据流如下：

```
+---------+       +--------+       +-----------------+
¦ Actions ¦------>¦ Stores ¦------>¦ View Components ¦
+---------+       +--------+       +-----------------+
     ^                                      ¦
     +--------------------------------------+
```

* 组件（视图），接收到用户手势操作后（点击，滑动），触发Actions，eg：Actions.someAction
* Actions被触发后，然后激发Stores中写好的方法，eg：OnSomeAction(Actions组件只是声明，具体的实现在Stores)
* Stores中有存储view中的state数据，写好的方法更新state数据，新版本的reflux.Compoment组件有直接继承react.Compoment，所以新版的reflux可以同步存储view的state，具体的看例子
* 更新的state触发view中的render方法，然后重新渲染view

##<a name="section2"></a>二、基本组件介绍
###2-1、组件Actions使用

```
var Actions = Reflux.createActions([
    "statusUpdate",
    "statusEdited",
    "statusAdded"
]);
```

###2-2、组件Stores使用

```
class StatusStore extends Reflux.Store
{
    constructor()
    {
        super();
        this.state = {flag:'OFFLINE'}; // <- set store's default state much like in React
        this.listenTo(statusUpdate, this.onStatusUpdate); // listen to the statusUpdate action
    }

    onStatusUpdate(status)
    {
        var newFlag = status ? 'ONLINE' : 'OFFLINE';
        this.setState({flag:newFlag});
    }
}
```

##<a name="section3"></a>三、使用demo

```
var Actions = Reflux.createActions([
	'increment',
	'decrement',
	'changeBy'
]);

class CounterStore extends Reflux.Store
{
	constructor()
	{
		super();
		this.state = {count: 0};
		this.listenables = Actions;
	}
	
	onIncrement()
	{
		this.setState({count: this.state.count+1});
	}
	
	onDecrement()
	{
		this.setState({count: this.state.count-1});
	}
	
	onChangeBy(amount)
	{
		this.setState({count: this.state.count+amount});
	}
}

class Counter extends Reflux.Component
{
	constructor(props)
	{
		super(props);
		this.store = CounterStore;
	}
	
	render()
	{
		return <div>{this.state.count}</div>;
	}
}

ReactDOM.render
(
	<Counter/>,
	document.querySelector('#react-root')
);

setInterval(Actions.increment, 1000);
```

[官方demo地址--亲测有效](https://github.com/reflux/refluxjs/blob/master/docs/other/examples.md)

##<a name="section4"></a>四、遇到的问题
###4-1、Actions无法被触发
详细描述：按照官方给的demo进行修改后，发现点击写好的div后，无法触发方法

问题定位：使用react官方给的工具，在google浏览器中安装插件，然后右键找到源码，在源码处打断点，发现不走这个断点，逐步排除，发现是onsomeAction写错，应该大写，onSomeAction

问题解决：