import 'package:easy_flutter/commands/interface/command.dart';

class SetArchCommand extends Command {
  @override
  List<String> get alias =>
      const <String>['architecture,clean-arch,clean-architecture'];

  @override
  String get description => 'It is a subcommand. It can be used with set. '
      'Ex: set arch. It will setup directories inside lib folder '
      'according to flutter clean architecture';

  @override
  Future<void> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  String? get hint => '`fl set arch`';

  @override
  String get name => 'arch';

  @override
  List<Command> get subCommands => const <Command>[];
}
