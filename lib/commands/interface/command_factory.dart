import 'package:easy_flutter/commands/interface/command.dart';

abstract class CommandFactory {
  Command parseCommand(List<String> args);
}
