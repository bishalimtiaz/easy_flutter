import 'package:easy_flutter/template/template.dart';

class TemplateMyApp implements Template {
  @override
  String get format => '''
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
  ''';
}
