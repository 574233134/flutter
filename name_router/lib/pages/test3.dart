import 'package:flutter/material.dart';
import '../model/PageInfo.dart';

class Test3Page extends StatelessWidget {
  PageInfo pageInfo;

  Test3Page({this.pageInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test3"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("id:" + (this.pageInfo.id as String)),
              Text("pageName:" + this.pageInfo.pageName)
            ],
          ),
        ),
      ),
    );
  }
}
