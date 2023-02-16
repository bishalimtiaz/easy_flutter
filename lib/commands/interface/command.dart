abstract class Command {
  String get name;

  String get description;

  List<String> get alias;

  String? get hint;

  List<Command> get subCommands;

  /// execute command
  Future<void> execute();

  bool validate() {
    return true;
  }
}
