import 'package:flutter/material.dart';
import 'package:network/HttpClientUse.dart';
import 'package:network/HttpUse.dart';
import 'package:network/UseDio.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网络请求',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list;

  @override
  void initState() {
    super.initState();
    _list = List();
    _list
      ..add('一、flutter系统自带 HttpClient')
      ..add('1.1. HttpClient - Get')
      ..add('1.2. HttpClient - Post')
      ..add('二、网络请求第三方库 http')
      ..add('2.1. http - Get')
      ..add('2.2. http - Get-convenience')
      ..add('2.3. http - Post')
      ..add('2.4. http - Post-convenience')
      ..add('三、网络请求第三方库 Dio')
      ..add('3.1. Dio - Get')
      ..add('3.2. Dio - Post-dioOfOptionsSetting')
      ..add('3.3. Dio - Post-newOptionSetting');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Net collection demo',
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Net collection demo'),
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0 || index == 3 || index == 8) {
                } else if (index == 1) {
                  loadData_sys_get();
                } else if (index == 2) {
                  loadData_sys_post();
                } else if (index == 4) {
                  loadData_http_get();
                } else if (index == 5) {
                  loadData_http_get_convenience();
                } else if (index == 6) {
                  loadData_http_post();
                } else if (index == 7) {
                  loadData_http_post_convenience();
                } else if (index == 9) {
                  loadData_dio_get();
                } else if (index == 10) {
                  loadData_dio_dioOfOptionsSetting();
                } else if (index == 11) {
                  loadData_dio_newOptionSetting();
                }
              },
              child: Container(
                child: ListTile(
                  title: Text(
                    '${_list[index]}',
                  ),
                ),
                color: (index == 0 || index == 3 || index == 8)
                    ? Colors.black12
                    : Colors.white,
                height: (index == 0 || index == 3 || index == 8) ? 55.0 : 65.0,
                alignment: Alignment.centerLeft,
              ),
            );
          },
        ),
      ),
    );
  }
}
