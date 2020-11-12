import 'package:flutter/services.dart';

const platform = const MethodChannel("com.test/name");

Future<bool> isEuropeUser() async {
  // Native channel
  const platform = const MethodChannel("com.test/name"); //分析1
  bool result = false;
  try {
    result = await platform.invokeMethod("isChinese"); //分析2
  } on PlatformException catch (e) {
    print(e.toString());
  }
  return result;
}

