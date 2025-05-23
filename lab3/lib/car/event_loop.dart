import 'dart:io';

import 'package:lab3/car/actions/car_action.dart';
import 'package:lab3/car/car_controller.dart';

class EventLoop {
  late final CarAction carAction;

  EventLoop(CarController controller) {
    carAction = CarAction(controller);
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

  void _executeAction(List<String> action) {
    int actionLength = action.length;
    final commandName = action[0];

    switch (actionLength) {
      case 2:
        final value = int.parse(action[1]);
        carAction.executeCommand(commandName, value);
      default:
        carAction.executeCommand(commandName);
    }
  }

  void run() {
    List<String> actionsList = _getActionsFromConsole();
    for (var action in actionsList) {
      try {
        final line = action.split(' ');
        _executeAction(line);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
