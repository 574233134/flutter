import 'dart:async';

import 'package:flutter/services.dart';

class SayHello {
  static const MethodChannel _channel = const MethodChannel('hello');

  static Future<String> hello(name) async {
    final String res = await _channel.invokeMethod('hello', name);
    return res;
  }
}
