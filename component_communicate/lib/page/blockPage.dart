import 'package:flutter/material.dart';

class BlockPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ParentWidget(
        title: "InheritedWidget 使用",
      ),
    );
  }
}
//父组件

class ParentWidget extends StatefulWidget {
  final String title;
  ParentWidget({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ParentWidgetState();
  }
}

class ParentWidgetState extends State<ParentWidget> {
  // 默认点击父组件背景为橙色
  Color containerBg = Colors.orange;
  //回调函数
  void changeBackgroundColor(Color newColor) {
    setState(() {
      containerBg = newColor; //修改状态
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
            child: new Column(
          children: <Widget>[
            Text(
              "一般用于子组件对父组件的传值。",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            new Text('点击子组件，修改父组件的背景颜色与子组件背景颜色一致'),
            new GestureDetector(
              onTap: () {
                changeBackgroundColor(Colors.orange);
              },
              child: new Container(
                width: 300,
                height: 300,
                color: containerBg,
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new childrenA(childrenACallBack: changeBackgroundColor),
                    new childrenB(childrenBCallBack: changeBackgroundColor),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

//子组件(组件A)
class childrenA extends StatelessWidget {
  //定义接收父类回调函数的指针
  final ValueChanged<Color> childrenACallBack;
  childrenA({Key key, this.childrenACallBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        //调用回调函数传值
        childrenACallBack(Colors.green);
      },
      child: new Container(
        width: 80,
        height: 80,
        color: Colors.green,
        child: new Text('ChildrenA'),
      ),
    );
  }
}

//子组件(组件B)
class childrenB extends StatelessWidget {
  final ValueChanged<Color> childrenBCallBack;
  childrenB({Key key, this.childrenBCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        childrenBCallBack(Colors.red);
      },
      child: new Container(
        width: 80,
        height: 80,
        color: Colors.red,
        child: new Text('ChildredB'),
      ),
    );
  }
}
