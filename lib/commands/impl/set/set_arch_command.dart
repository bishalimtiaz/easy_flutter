import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/constants/command_name.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class SetArchCommand extends Command {
  @override
  List<String> get alias =>
      const <String>['architecture,clean-arch,clean-architecture'];

  @override
  String get description => EasyStrings.commandArchDescription;

  @override
  Future<void> execute() async {
    LogService.info("set arch called", false, false);
    //create directories in root folder
    //create files in directories
  }

  @override
  String? get hint => EasyStrings.commandArchHint;

  @override
  String get name => CommandName.arch;

  @override
  List<Command> get subCommands => const <Command>[];
}
