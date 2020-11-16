import 'package:flutter/material.dart';
import 'channel.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(children: [
              FlatButton(
                onPressed: () async {
                  var futureValue = await SayHello.hello('李梦珂');
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
                  'sayHello',
                  style: TextStyle(fontSize: 12.0),
                ),
                color: Colors.red,
                textColor: Colors.white,
              )
            ])),
      ),
    );
  }
}
