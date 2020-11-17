import 'package:flutter/material.dart';
import 'package:name_router/CustomRouter.dart';
import '../model/PageInfo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var pageinfo = PageInfo.fromJsonMap({"id": '测试', "pageName": "页面3"});

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteName.test1),
              child: Text("test1page"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(RouteName.test2, arguments: ['李梦珂', '123456']),
              child: Text("test2page"),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(RouteName.test3, arguments: pageinfo),
              child: Text("test3page"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
