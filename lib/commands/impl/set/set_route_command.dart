import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/constants/command_name.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';

class SetRouteCommand extends Command {
  @override
  String get description => EasyStrings.commandSetRouteDescription;

  @override
  Future<void> execute() async {
    LogService.info(description, false, false);
  }

  @override
  String? get hint => EasyStrings.commandSetRouteHint;

  @override
  String get name => CommandName.route;
}
