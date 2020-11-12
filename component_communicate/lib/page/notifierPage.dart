import 'package:flutter/material.dart';
import 'dart:math';

// 定义ValueNotifierData类，继承ValueNotifier
class ValueNotifierData extends ValueNotifier<String> {
  ValueNotifierData(value) : super(value);
}

// 定义_WidgetOne，包含一个ValueNotifierData的实例。
class _WidgetOne extends StatefulWidget {
  _WidgetOne({this.data});
  final ValueNotifierData data;
  @override
  _WidgetOneState createState() => _WidgetOneState();
}

// _WidgetOneState中给ValueNotifierData实例添加监听。
class _WidgetOneState extends State<_WidgetOne> {
  String info;
  @override
  initState() {
    super.initState();
    widget.data.addListener(_handleValueChanged);
    info = 'Initial mesage: ' + widget.data.value;
  }

  void _handleValueChanged() {
    setState(() {
      info = 'Message changed to: ' + widget.data.value;
    });
  }

  @override
  dispose() {
    widget.data.removeListener(_handleValueChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(info),
    );
  }
}

class ValueNotifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifierData vd = ValueNotifierData('Hello World');
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier Communication'),
      ),
      body: _WidgetOne(data: vd),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            vd.value = randomString();
          }),
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
