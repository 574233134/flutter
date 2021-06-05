// ProviderPage.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/CountProviderModel.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountProviderModel>(
      create: (_) => CountProviderModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ProviderPage"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('点击按钮的次数:'),
                Consumer<CountProviderModel>(
                  builder: (context, notifier, child) {
                    return Text("${notifier.count}");
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<CountProviderModel>().increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
