import 'package:easy_flutter/commands/impl/set/set_arch_command.dart';
import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/constants/command_name.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class SetCommand extends Command {
  @override
  List<String> get alias => const <String>[];

  @override
  String get description => EasyStrings.commandSetDescription;

  @override
  Future<void> execute() async{
    LogService.error(description);
    LogService.info(hint ?? "",false,false);
  }

  @override
  String? get hint => EasyStrings.commandSetHint;

  @override
  String get name => CommandName.set;

  @override
  List<Command> get subCommands => <Command>[
        SetArchCommand(),
      ];
}
