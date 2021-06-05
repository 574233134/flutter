import 'package:flutter/material.dart';

final GlobalKey<SubWidgetAState> subAkey = GlobalKey<SubWidgetAState>();

final GlobalKey<SubWidgetBState> subBkey = GlobalKey<SubWidgetBState>();

class GlobalKeyPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ParentWidget(),
    );
  }
}

//父组件
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Global key'),
      ),
      body: new Center(
        child: new Container(
          color: Colors.grey,
          width: 200,
          height: 200,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new SubWidgetA(key: subAkey),
              new SubWidgetB(key: subBkey)
            ],
          ),
        ),
      ),
    );
  }
}

//子组件A

class SubWidgetA extends StatefulWidget {
  SubWidgetA({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new SubWidgetAState();
  }
}

class SubWidgetAState extends State<SubWidgetA> {
  Color _backgroundColors = Colors.red; //红色
  void updateBackGroundColors(Color colos) {
    setState(() {
      _backgroundColors = colos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        // 在A组件中通过key调用B组件改变颜色的方法
        subBkey.currentState.updateBackGroundColors(Colors.blue);
        setState(() {
          _backgroundColors = Colors.red;
        });
      },
      child: new Container(
        width: 80,
        height: 80,
        color: _backgroundColors,
        alignment: Alignment.center,
        child: new Text('SubWidgetA'),
      ),
    );
  }
}

//子组件B
class SubWidgetB extends StatefulWidget {
  SubWidgetB({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new SubWidgetBState();
  }
}

class SubWidgetBState extends State<SubWidgetB> {
  Color _backgroundColors = Colors.green; //绿色
  void updateBackGroundColors(Color colos) {
    setState(() {
      _backgroundColors = colos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        // 在B组件中通过key调用A组件改变颜色的方法
        subAkey.currentState.updateBackGroundColors(Colors.blue);
        setState(() {
          _backgroundColors = Colors.green;
        });
      },
      child: new Container(
        width: 80,
        height: 80,
        color: _backgroundColors,
        alignment: Alignment.center,
        child: new Text('SubWidgetB'),
      ),
    );
  }
}
