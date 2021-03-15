import 'dart:async';

import 'package:flutter/services.dart';

class SayHello {
  static const MethodChannel _channel = const MethodChannel('hello');

  static Future<String> hello(name) async {
    final String res = await _channel.invokeMethod('hello', name);
    return res;
  }

  static Future<String> startSendMessage() async {
    final String res = await _channel.invokeMethod('startSendMessage');
    return res;
  }
}

class EventUntils {
  static const EventChannel _enventChannel =
      const EventChannel("com.channel.eventchannel");
  List<EventListener> listenerList;
  factory EventUntils() => _getInstance();

  static EventUntils get instance => _getInstance();
  static EventUntils _instance;

  EventUntils._internal() {
    listenerList = [];
    _enventChannel.receiveBroadcastStream().listen(
          _onEvent,
          onError: _onError,
        );
  }

  static EventUntils _getInstance() {
    if (_instance == null) {
      _instance = new EventUntils._internal();
    }
    return _instance;
  }

  void addListener(EventListener listener) {
    if (listener == null) {
      return;
    }
    listenerList.add(listener);
  }

  void _onEvent(Object event) {
    print("_onEvent is invoke$event");
    for (EventListener listener in listenerList) {
      listener.onEvent(event);
    }
  }

  void _onError(Object error) {
    for (EventListener listener in listenerList) {
      listener.onError(error);
    }
  }
}

abstract class EventListener {
  void onEvent(Object event);

  void onError(Object error);
}
