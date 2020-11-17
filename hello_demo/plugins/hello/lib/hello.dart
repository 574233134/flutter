import 'dart:async';

import 'package:flutter/services.dart';

class Hello {
  static const MethodChannel _channel = const MethodChannel('hello');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> hello(name) async {
    final String res = await _channel.invokeMethod('hello', name);
    return res;
  }
}
