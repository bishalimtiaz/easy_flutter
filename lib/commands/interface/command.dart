import 'package:easy_flutter/commands/impl/error_command.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';

abstract class Command {
  String get name;

  String get description;

  List<String> get alias;

  String? get hint;

  List<Command> get subCommands;

  Command withArgs(List<String> args) => _findSubCommand(args);

  /// execute command
  Future<void> execute();

  bool validate() {
    return true;
  }

  Command _findSubCommand(List<String> args) {
    if (args.isEmpty) return this;
    for (final subCommand in subCommands) {
      if (args.first == subCommand.name) {
        return subCommand._findSubCommand(args.sublist(1));
      }
    }
    return ErrorCommand('${EasyStrings.unknownCommand} "${args.first}".');
  }
}
