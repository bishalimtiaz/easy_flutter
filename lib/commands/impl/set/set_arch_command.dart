import 'package:easy_flutter/commands/interface/command.dart';
import 'package:easy_flutter/common/constants/command_name.dart';
import 'package:easy_flutter/common/constants/easy_strings.dart';
import 'package:easy_flutter/common/utils/logger/log_utils.dart';
import 'package:easy_flutter/operations/set_arch_operation.dart';
import 'package:easy_flutter/services/impl/directory_service_impl.dart';
import 'package:easy_flutter/services/impl/file_service_impl.dart';

class SetArchCommand extends Command {
  @override
  List<String> get alias =>
      const <String>['architecture,clean-arch,clean-architecture'];

  @override
  String get description => EasyStrings.commandArchDescription;

  @override
  Future<void> execute() async {
    SetArchOperation(
      fileService: FileServiceImpl(),
      directoryService: DirectoryServiceImpl(),
    ).execute().then(
      (value) {
        LogService.info("Architecture setup successful!", false, false);
      },
    ).catchError(
      (error) {
        throw error;
      },
    );
  }

  @override
  String? get hint => EasyStrings.commandArchHint;

  @override
  String get name => CommandName.arch;

  @override
  List<Command> get subCommands => const <Command>[];
}
