import 'package:flutter/material.dart';
import 'package:native_api/native_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = "I Like Flutter";
  void _updateText() {
    setState(() {
      // update the text
      textToShow = "Flutter is Awesome!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
          child: FlatButton(
        onPressed: () async {
          var futureValue = await NativeApi.countOfString("abc");
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  futureValue,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        },
        child: Text(
          '获取 abc 长度',
          style: TextStyle(fontSize: 12.0),
        ),
        color: Colors.red,
        textColor: Colors.white,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
