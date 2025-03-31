import 'dart:io';

import 'actions/tv_action.dart';
import 'controller.dart';

class EventLoop {
  late final TvAction tvAction;

  EventLoop(Controller controller) {
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
    final receivedAction = line.split(' ');
    if (receivedAction.length < 2) return receivedAction;

    const multiArgCommands = {
      'SetChannelName',
      'GetChannelByName',
      'DeleteChannelName',
      'SelectChannel',
    };

    final command = receivedAction[0];
    if (!multiArgCommands.contains(command)) return receivedAction;

    final firstArg = receivedAction[1];
    final secondArg = receivedAction.sublist(2).join(' ');
    return [command, firstArg, secondArg];
  }

  void run() {
    List<String> actions = _getActionsFromConsole();
    for (final action in actions) {
      try {
        final List<String> commands = _parseActionList(action);
        String commandName = commands[0];
        dynamic firstValue = commands.length > 1 ? _parseValue(commands[1]) : null;
        dynamic secondValue = commands.length > 2 ? _parseValue(commands[2]) : null;

        tvAction.executeCommand(commandName, firstValue, secondValue);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static dynamic _parseValue(String value) {
    if (int.tryParse(value) != null) {
      return int.parse(value);
    } else if (double.tryParse(value) != null) {
      return double.parse(value);
    } else {
      return value;
    }
  }
}