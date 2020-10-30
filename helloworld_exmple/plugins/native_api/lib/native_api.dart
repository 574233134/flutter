import 'dart:async';

import 'package:flutter/services.dart';

class NativeApi {
  static const MethodChannel _channel = const MethodChannel('native_api');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> countOfString(str) async {
    final String count = await _channel.invokeMethod('countOfString', str);
    return count;
  }
}
