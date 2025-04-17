import 'dart:io';

import 'actions/tv_action.dart';
import 'tv_controller.dart';

class EventLoop {
  late final TvAction tvAction;

  EventLoop(TvController controller) {
    tvAction = TvAction(controller);
  }

  List<String> _getActionsFromConsole() {
    List<String> actions = [];
    while (true) {
      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) break;
      actions.add(input);
    }
    return actions;
  }

  List<String> _parseActionList(String line) {
    final parts = line.split(' ');

    if (parts.isEmpty) return [];

    const commandArgs = {
      'SetChannelName': 2,
      'GetChannelByName': 1,
      'DeleteChannelName': 1,
      'SelectChannel': 1,
    };

    final command = parts[0];
    final expectedArgs = commandArgs[command] ?? 0;

    if (expectedArgs == 0) return parts;

    final args = parts.sublist(1);
    if (args.length < expectedArgs) {
      throw FormatException('Not enough arguments for command: $command');
    }

    switch (expectedArgs) {
      case 1:
        return [command, args.join(' ')];
      case 2:
        return [command, args[0], args.sublist(1).join(' ')];
      default:
        return parts;
    }
  }

  void _executeCommand(String commandName, final firstValue,
      final secondValue) {
    try {
      tvAction.executeCommand(commandName, firstValue, secondValue);
    } catch (e) {
      print(e.toString());
    }
  }

  void run() {
    List<String> actions = _getActionsFromConsole();
    for (final action in actions) {
      try {
        final List<String> commands = _parseActionList(action);
        String commandName = commands[0];
        final firstValue = commands.length > 1
            ? _parseValue(commands[1])
            : null;
        final secondValue = commands.length > 2
            ? _parseValue(commands[2])
            : null;

        _executeCommand(commandName, firstValue, secondValue);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static _parseValue(String value) {
    if (int.tryParse(value) != null) {
      return int.parse(value);
    } else {
      return value;
    }
  }
}