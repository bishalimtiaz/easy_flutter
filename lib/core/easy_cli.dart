import 'package:easy_flutter/commands/command_list.dart';
import 'package:easy_flutter/commands/interface/command.dart';
import 'package:collection/collection.dart';

class EasyCLI {
  final List<String> _arguments;

  EasyCLI(this._arguments);

  void run() async {
    if (_arguments.isEmpty) {
      printUsage();
      return;
    }

    final Command? command = commands.firstWhereOrNull(
      (command) => command.name == _arguments.first,
    );

    if (command == null) {
      printUsage();
      return;
    }

    await command.execute();
  }

  void printUsage() {
    print('Usage: dart cli.dart <command> [arguments]');
    print('');
    print('Available commands:');

    for (final command in commands) {
      print('${command.name.padRight(12)} ${command.description}');
    }
  }
}
