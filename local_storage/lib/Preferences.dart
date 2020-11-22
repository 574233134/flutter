import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesPage extends StatefulWidget {
  @override // 重写
  State<StatefulWidget> createState() => StorageState();
}

class StorageState extends State {
  var _valueFieldController = new TextEditingController();
  var _keyFieldController = new TextEditingController();
  var _storageString = '';
  String STORAGE_KEY = '';

  // 利用SharedPreferences存储数据
  Future saveString() async {
    STORAGE_KEY = _keyFieldController.value.text.toString();
    if (STORAGE_KEY != null && STORAGE_KEY.length > 0) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
          STORAGE_KEY, _valueFieldController.value.text.toString());
    }
  }

  // 获取存在SharedPreferences中的数据
  Future getString() async {
    STORAGE_KEY = _keyFieldController.value.text.toString();
    if (STORAGE_KEY != null && STORAGE_KEY.length > 0) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      setState(() {
        _storageString = sharedPreferences.get(STORAGE_KEY);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shared Preferences存储'),
      ),
      body: new Column(
        children: <Widget>[
          Text("请输入key", textAlign: TextAlign.center),
          TextField(
            controller: _keyFieldController,
          ),
          Text("请输入value", textAlign: TextAlign.center),
          TextField(
            controller: _valueFieldController,
          ),
          MaterialButton(
            onPressed: saveString,
            child: new Text("存储"),
            color: Colors.pink,
          ),
          MaterialButton(
            onPressed: getString,
            child: new Text("获取"),
            color: Colors.lightGreen,
          ),
          Text('shared_preferences存储的值为  $_storageString'),
        ],
      ),
    );
  }
}
