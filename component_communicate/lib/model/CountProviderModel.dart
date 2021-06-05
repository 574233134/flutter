import 'package:flutter/material.dart';

class CountProviderModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    print("increment");
    _count++;
    notifyListeners();
  }
}
