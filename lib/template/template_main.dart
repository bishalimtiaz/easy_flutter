import 'package:easy_flutter/template/template.dart';

class TemplateMain implements Template {
  @override
  String get format => '''
import 'app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}
  ''';
}
