import 'dart:io';

import 'actions/tv_action.dart';
import 'tv_controller.dart';

class EventLoop {
  late final TvAction tvAction;

  EventLoop(TvController controller) {
    tvAction = TvAction(controller);
  }

  // Получение списка команд из консоли
  List<String> _getActionsFromConsole() {
    List<String> actions = [];
    while (true) {
      String? input = stdin.readLineSync();
      if (input == null || input.isEmpty) break;
      actions.add(input);
    }
    return actions;
  }

  // Парсинг строки в список команд
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

  // Выполнение команды
  void _executeCommand<T1, T2>(
      String commandName, T1 firstValue, T2 secondValue) {
    try {
      tvAction.executeCommand<T1, T2>(commandName, firstValue, secondValue);
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

        // Парсим значения
        final firstValue = _parseArgument(commands, 1);
        final secondValue = _parseArgument(commands, 2);

        if (firstValue is int && secondValue is String) {
          _executeCommand<int, String>(commandName, firstValue, secondValue);
        } else if (firstValue != null && secondValue == null) {
          if (firstValue is int) {
            _executeCommand<int, void>(commandName, firstValue, null);
          } else if (firstValue is String) {
            _executeCommand<String, void>(commandName, firstValue, null);
          }
        } else {
          _executeCommand<String, void>(
              commandName, firstValue.toString(), null);
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static dynamic _parseArgument(List<String> commands, int index) {
    if (index >= commands.length) return null;

    final value = commands[index];
    if (int.tryParse(value) != null) {
      return int.parse(value);
    } else {
      return value;
    }
  }
}
