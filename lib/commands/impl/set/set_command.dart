import 'package:easy_flutter/commands/impl/set/set_arch.dart';
import 'package:easy_flutter/commands/interface/command.dart';

class SetCommand extends Command {
  @override
  List<String> get alias => const <String>[];

  @override
  String get description =>
      'set is a group command. It will setup some code or '
      'architecture according to following sub-command';

  @override
  Future<void> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  String? get hint => 'set is a group command. '
      'You need sub commands after set like `fl set arch`';

  @override
  String get name => 'set';

  @override
  List<Command> get subCommands => <Command>[
        SetArchCommand(),
      ];
}
