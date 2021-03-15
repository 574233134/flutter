import 'package:flutter/material.dart';
import 'channel.dart';

class EventChannelPage extends StatefulWidget {
  @override
  EventChannelPageState createState() {
    return EventChannelPageState();
  }
}

class EventChannelPageState extends State<EventChannelPage> {
  String reciveMsg;
  TestListener eventListener;

  _changeReciveMsg(Object event) {
    setState(() {
      reciveMsg = event.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    eventListener = new TestListener();
    reciveMsg = "原生发送到Flutter的消息";
    eventListener.onEventCallback = _changeReciveMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          new Text(reciveMsg),
          FlatButton(onPressed: startListner, child: Text("开始监听")),
        ],
      ),
    );
  }

  startListner() {
    SayHello.startSendMessage();
  }
}

class TestListener extends EventListener {
  Function onErrorCallback;
  Function onEventCallback;
  @override
  void onError(Object error) {
    onErrorCallback(error);
  }

  @override
  void onEvent(Object event) {
    onEventCallback();
  }
}
