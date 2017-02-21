# react学习笔记（1）

引子：总结归档react相关知识

> [基本知识准备](#prepare)
> >[jsx语法基本规则](#base_jsx)
> >
> >[定义一个react组件](#create_componse)
> 
> [react-reflux使用](#reflux)
>
>
>
>

##<a name=“prepare”></a>基础知识准备

###React.Component || React Without ES6 
参考：

[react without es6](https://facebook.github.io/react/docs/react-without-es6.html)

[React.Component](https://facebook.github.io/react/docs/react-component.html)

[react入门指南-阮一峰](http://www.ruanyifeng.com/blog/2015/03/react.html)

[React Router 使用教程](http://www.ruanyifeng.com/blog/2016/05/react_router.html?utm_source=tool.lu)

###<a name="base_jsx"></a>jsx语法基本规则
遇到 HTML 标签（以 < 开头），就用 HTML 规则解析；遇到代码块（以 { 开头），就用 JavaScript 规则解析，例子如下：

```
var names = ['Alice', 'Emily', 'Kate'];

ReactDOM.render(
  <div>
  {
    names.map(function (name) {
      return <div>Hello, {name}!</div>
    })
  }
  </div>,
  document.getElementById('example')
);
```
运行结果：

```
Hello,Alice!
Hello,Emily!
Hello,Kate!
```

###<a name="create_componse"></a>定义一个React组件

####1.最基础的样式

* 使用es6的情况下，代码如下：

```
class Greeting extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

* 不使用es6的情况下，代码如下：

```
var Greeting = React.createClass({
  render: function() {
    return <h1>Hello, {this.props.name}</h1>;
  }
});
```

**warning:**

1.所有组件类都必须有自己的 render 方法，用于输出组件。

2.组件类的第一个字母必须大写，否则会报错，比如HelloMessage不能写成helloMessage

3.组件类只能包含一个顶层标签，否则也会报错。

####2.组件类的PropTypes属性
组件的属性可以接受任意值，字符串、对象、函数等等都可以。有时，我们需要一种机制，验证别人使用组件时，提供的参数是否符合要求。

组件类的PropTypes属性，就是用来验证组件实例的属性是否符合要求

```
var MyTitle = React.createClass({
  propTypes: {
    title: React.PropTypes.string.isRequired,
  },

  render: function() {
     return <h1> {this.props.title} </h1>;
   }
});
```
上面的Mytitle组件有一个title属性。PropTypes 告诉 React，这个 title 属性是必须的，而且它的值必须是字符串。现在，我们设置 title 属性的值是一个数值。

此外，getDefaultProps 方法可以用来设置组件属性的默认值。

#####例子
* es6的情况下：

```
class Greeting extends React.Component {
  // ...
}

Greeting.propTypes = {
  name: React.PropTypes.string
};

Greeting.defaultProps = {
  name: 'Mary'
};
```

* jsx的情况下：

```
var Greeting = React.createClass({
  propTypes: {
    name: React.PropTypes.string
  },

  getDefaultProps: function() {
    return {
      name: 'Mary'
    };
  },

  // ...

});
```

####3.react的状体机制
组件免不了要与用户互动，React 的一大创新，就是将组件看成是一个状态机，一开始有一个初始状态，然后用户互动，导致状态变化，从而触发重新渲染 UI 

eg(阮一峰博客):

```
var LikeButton = React.createClass({
  getInitialState: function() {
    return {liked: false};
  },
  handleClick: function(event) {
    this.setState({liked: !this.state.liked});
  },
  render: function() {
    var text = this.state.liked ? 'like' : 'haven\'t liked';
    return (
      <p onClick={this.handleClick}>
        You {text} this. Click to toggle.
      </p>
    );
  }
});

ReactDOM.render(
  <LikeButton />,
  document.getElementById('example')
);
```

* es6写法：

**In ES6 classes, you can define the initial state by assigning this.state in the constructor**

```
class SayHello extends React.Component {
  constructor(props) {
    super(props);
    this.state = {message: 'Hello!'};
    // This line is important!
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    alert(this.state.message);
  }

  render() {
    // Because `this.handleClick` is bound, we can use it as an event handler.
    return (
      <button onClick={this.handleClick}>
        Say hello
      </button>
    );
  }
}
```

In React components declared as ES6 classes, methods follow the same semantics as regular ES6 classes. This means that they don't automatically bind this to the instance. You'll have to explicitly use .bind(this) in the constructor:

* jsx写法：

**With React.createClass(), you have to provide a separate getInitialState method that returns the initial state**

```
var SayHello = React.createClass({
  getInitialState: function() {
    return {message: 'Hello!'};
  },

  handleClick: function() {
    alert(this.state.message);
  },

  render: function() {
    return (
      <button onClick={this.handleClick}>
        Say hello
      </button>
    );
  }
});
```

####4.组件的生命周期
组件的生命周期分成三个状态：

```
* Mounting：已插入真实 DOM
* Updating：正在被重新渲染
* Unmounting：已移出真实 DOM
```
React 为每个状态都提供了两种处理函数，will 函数在进入状态之前调用，did 函数在进入状态之后调用，三种状态共计五种处理函数

```
* componentWillMount()
* componentDidMount()
* componentWillUpdate(object nextProps, object nextState)
* componentDidUpdate(object prevProps, object prevState)
* componentWillUnmount()
```

[React Without ES6](https://facebook.github.io/react/docs/react-without-es6.html)

[阮一峰基础教程](http://www.ruanyifeng.com/blog/2015/03/react.html)



##<a name="reflux"></a>reflux使用
参考：

[reflux基本介绍与使用](http://www.tuicool.com/articles/J3Mz2a)

[reflux与flux等的比较使用](http://www.cnblogs.com/lovesueee/p/4893218.html)

[官方文档](https://github.com/reflux/refluxjs/tree/master)


