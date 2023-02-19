import 'package:easy_flutter/commands/command_list.dart';
import 'package:easy_flutter/commands/impl/error_command.dart';
import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/commands/interface/command_factory.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';

class EasyCommandFactory implements CommandFactory {
  @override
  Command parseCommand(List<String> args) {
    final command = _findCommand(commands, args);
    return command;
  }

  Command _findCommand(List<Command> commands, List<String> args) {
    if (args.isEmpty) {
      return ErrorCommand(EasyStrings.errorNoCommandSpecified);
    }

    final commandName = args[0];
    final matchingCommands =
        commands.where((command) => command.name == commandName).toList();

    if (matchingCommands.isEmpty) {
      return ErrorCommand('${EasyStrings.unknownCommand}: $commandName');
    }

    final command = matchingCommands.first;

    if (args.length == 1) {
      return command;
    }

    final subArgs = args.sublist(1);
    final matchingSubCommands = command.subCommands
        .where((subCommand) => subCommand.name == subArgs[0])
        .toList();

    if (matchingSubCommands.isEmpty) {
      return command.withArgs(subArgs);
    }

    return _findCommand(matchingSubCommands, subArgs);
  }
}
