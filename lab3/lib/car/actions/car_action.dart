import 'package:lab3/car/actions/car_command.dart';
import 'package:lab3/car/car_controller.dart';

class CarAction {
  final CarController controller;

  CarAction(this.controller);

  void executeCommand(String action, [int? value]) {
    CarCommand? receivedAction = _parseAction(action, value);
    if (receivedAction != null) {
      receivedAction.execute();
      return;
    }

    throw Exception('Unavailable action received');
  }

  CarCommand? _parseAction(String command, [int? value]) {
    switch (command) {
      case 'EngineOn':
        return EngineOnCommand(controller);
      case 'EngineOff':
        return EngineOffCommand(controller);
      case 'SetGear':
        return SetGearCommand(controller, value as int);
      case 'SetSpeed':
        return SetSpeedCommand(controller, value as int);
      case 'Info':
        return GetInfoCommand(controller);
    }
  }
}
