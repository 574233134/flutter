import 'package:flutter/material.dart';
import 'page/InheritedPage.dart';
import 'page/blockPage.dart';
import 'page/globalKeyPage.dart';
import 'page/notifierPage.dart';
import 'page/eventbusPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '组件间通信',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('组件间通信'),
      ),
      body: new Center(
          child: new Column(
        children: [
          new RaisedButton(
            child: new Text('回调通信'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new BlockPage()),
              );
            },
          ),
          new RaisedButton(
            child: new Text('InheritedWidget'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new InheritedPage()),
              );
            },
          ),
          new RaisedButton(
            child: new Text('GlobalKey'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new GlobalKeyPage()),
              );
            },
          ),
          new RaisedButton(
            child: new Text('ValueNotifier'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new ValueNotifierPage()),
              );
            },
          ),
          new RaisedButton(
            child: new Text('EventBus'),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new EventBusPage()),
              );
            },
          ),
        ],
      )),
    );
  }
}
