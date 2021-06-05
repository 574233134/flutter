import 'package:flutter/material.dart';

class InheritedPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("InheritedWidget 使用"),
      ),
      body: new InheritedWidgetTestContainer(),
    );
  }
}

//模型数据
class InheritedTestModel {
  final int count;
  const InheritedTestModel(this.count);
}

//哨所（自定义InheritedWidget类）
class InheritedContext extends InheritedWidget {
  //构造函数
  InheritedContext(
      {Key key,
      @required this.inheritedTestModel,
      @required this.increment,
      @required this.reduce,
      @required Widget child})
      : super(key: key, child: child);

  //变量（要共享的数据）
  final InheritedTestModel inheritedTestModel;
  final Function() increment;
  final Function() reduce;

  //静态方法
  static InheritedContext of(BuildContext context) {
    InheritedContext contexts =
        context.dependOnInheritedWidgetOfExactType<InheritedContext>();
    return contexts;
  }

  //该回调决定当count发生变化时，是否通知子树中依赖count的Widget
  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return inheritedTestModel != oldWidget.inheritedTestModel;
  }
}

class TestWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('+'),
          onPressed: inheritedContext.increment),
    );
  }
}

class TestWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return new Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10.0),
      child: new RaisedButton(
          textColor: Colors.black,
          child: new Text('-'),
          //使用InheritedWidget中的reduce方法
          onPressed: inheritedContext.reduce),
    );
  }
}

class TestWidgetC extends StatefulWidget {
  @override
  TestWidgetCState createState() => new TestWidgetCState();
}

class TestWidgetCState extends State<TestWidgetC> {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    final inheritedTestModel = inheritedContext.inheritedTestModel;

    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: new RaisedButton(
        textColor: Colors.black,
        child: new Text('${inheritedTestModel.count}'),
        onPressed: () {},
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetTestContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InheritedWidgetTestContainerState();
  }
}

class InheritedWidgetTestContainerState
    extends State<InheritedWidgetTestContainer> {
  InheritedTestModel _inheritedTestModel;

  _initData() {
    _inheritedTestModel = new InheritedTestModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _incrementCount() {
    setState(() {
      _inheritedTestModel =
          new InheritedTestModel(_inheritedTestModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      _inheritedTestModel =
          new InheritedTestModel(_inheritedTestModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedContext(
      inheritedTestModel: _inheritedTestModel,
      increment: _incrementCount,
      reduce: _reduceCount,
      child: new Scaffold(
          body: new Center(
        child: new Column(
          children: <Widget>[
            Text(
              "一般用于父组件对子组件的跨组件传值。",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            Text(
              "业务开发中经常会碰到这样的情况，多个Widget需要同步同一份全局数据，比如共享应用主题和当前语言环境信息",
            ),
            new TestWidgetA(),
            new TestWidgetB(),
            new TestWidgetC(),
          ],
        ),
      )),
    );
  }
}
