import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'dart:math';

EventBus eventBus;

class EventBusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBus Communication'),
      ),
      body: _WidgetOne(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            String str = randomString();
            eventBus.fire(str);
          }),
    );
  }
}

// 定义_WidgetOne，包含一个ValueNotifierData的实例。
class _WidgetOne extends StatefulWidget {
  _WidgetOne({Key key}) : super(key: key);
  @override
  _WidgetOneState createState() => _WidgetOneState();
}

// _WidgetOneState中给ValueNotifierData实例添加监听。
class _WidgetOneState extends State<_WidgetOne> {
  String eventBusInfo;
  @override
  initState() {
    super.initState();
    eventBus = EventBus(); // 初始化 EventBus
    eventBusInfo = 'Initial mesage: Hello World';
    eventBus.on<String>().listen((info) {
      print(info);
      _handleValueChanged(info);
    });
  }

  void _handleValueChanged(info) {
    setState(() {
      eventBusInfo = info;
    });
  }

  @override
  dispose() {
    super.dispose();
    eventBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(eventBusInfo),
    );
  }
}

String randomString() {
  String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
  int strlenght = 10;

  /// 生成的字符串固定长度
  String left = '';
  for (var i = 0; i < strlenght; i++) {
    left = left + alphabet[Random().nextInt(alphabet.length)];
  }
  return left;
}
