import 'package:easy_flutter/commands/impl/info_command.dart';
import 'package:easy_flutter/commands/impl/set/set_command.dart';
import 'package:easy_flutter/commands/interface/command.dart';

final List<Command> commands = <Command>[
  InfoCommand(),
  SetCommand(),
];
