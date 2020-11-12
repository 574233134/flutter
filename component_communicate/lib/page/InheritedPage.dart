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

  //变量
  final InheritedTestModel inheritedTestModel;
  final Function() increment;
  final Function() reduce;

  //静态方法
  static InheritedContext of(BuildContext context) {
    InheritedContext contexts =
        context.dependOnInheritedWidgetOfExactType<InheritedContext>();
    return contexts;
  }

  //是否重建取决于Widget组件是否相同
  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
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
          onPressed: inheritedContext.reduce),
    );
  }
}

class TestWidgetC extends StatelessWidget {
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
              "业务开发中经常会碰到这样的情况，多个Widget需要同步同一份全局数据，比如点赞数、评论数、夜间模式等等",
            ),
            new TestWidgetA(),
            new TestWidgetB(),
            new TestWidgetC(),
            new RaisedButton(
                child: new Text('back'),
                onPressed: () {
                  // Navigate back to first screen when tapped!
                  Navigator.pop(context);
                })
          ],
        ),
      )),
    );
  }
}
