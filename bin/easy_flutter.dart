import 'package:easy_flutter/core/easy_cli.dart';

void main(List<String> arguments) {
  var time = Stopwatch();
  time.start();

  EasyCLI(arguments).run();
}
