abstract class EasyStrings {
  EasyStrings._();

  static const String usage = 'Usage: dart cli.dart <command> [arguments]';
  static const String availableCommands = 'Available commands:';
  static const String errorNoCommandSpecified = 'No command specified';
  static const String unknownCommand = 'Unknown command';
  static const String commandInfoDescription =
      'This command returns the information of the CLI';
  static const String commandInfoHint = 'run `fl info`';
  static const String commandArchDescription = '''
      It is a subcommand. It can be used with set. 
      Ex: set arch. It will setup directories inside lib folder '
      according to flutter clean architecture
      ''';
  static const String commandArchHint = 'run `fl set arch`';
  static const String commandSetDescription = '''
      set is a group command. It will setup some code or 
      architecture according to following sub-command
      ''';
  static const String commandSetHint = '''
      set is a group command. 
      You need sub commands after set like `fl set arch`
      ''';

  static const String commandSetRouteDescription = '''
        It will setup routes using go_router.
        Everytime you add any route you need to add in Routes and Paths in routes.dart file
        and defines the routing dependencies and screens.
        ''';
  static const String commandSetRouteHint = 'run fl set route';
}
