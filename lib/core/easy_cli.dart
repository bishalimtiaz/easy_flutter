import 'package:easy_flutter/commands/command_list.dart';
import 'package:easy_flutter/commands/impl/easy_command_factory.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class EasyCLI {
  final List<String> _arguments;

  EasyCLI(this._arguments);

  void run() async {
    final command = EasyCommandFactory().parseCommand(_arguments);
    await command.execute();
  }

  void printUsage() {
    LogService.info(EasyStrings.usage,false,false);
    print('');
    LogService.info(EasyStrings.usage,false,false);

    for (final command in commands) {
      print('${command.name.padRight(12)} ${command.description}');
    }
  }
}
