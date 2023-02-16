import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class InfoCommand extends Command {
  @override
  List<String> get alias => const <String>[];

  @override
  // TODO: implement hint
  String? get hint => throw UnimplementedError();

  @override
  String get name => 'info';

  @override
  List<Command> get subCommands => const <Command>[];

  @override
  Future<void> execute() async {
    LogService.info('Version: 0.0.0', false, false);
    LogService.info('run `get help` to help', false, false);
  }

  @override
  String get description => "This is Info Command";
}
