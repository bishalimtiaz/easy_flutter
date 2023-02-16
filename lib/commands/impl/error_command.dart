import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class ErrorCommand extends Command {
  String error = "";

  ErrorCommand(this.error);

  @override
  // TODO: implement alias
  List<String> get alias => throw UnimplementedError();

  @override
  // TODO: implement hint
  String? get hint => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement subCommands
  List<Command> get subCommands => throw UnimplementedError();

  @override
  Future<void> execute() async {
    LogService.error(error);
    LogService.info('run `get help` to help', false, false);
  }

  @override
  // TODO: implement description
  String get description => "This Is Error Command";
}
