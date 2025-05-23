import 'package:lab3/car/car_controller.dart';

abstract class CarCommand {
  void execute();
}

class EngineOnCommand implements CarCommand {
  final CarController controller;

  EngineOnCommand(this.controller);

  @override
  void execute() {
    print(controller.turnOn());
  }
}

class EngineOffCommand implements CarCommand {
  final CarController controller;

  EngineOffCommand(this.controller);

  @override
  void execute() {
    print(controller.turnOff());
  }
}

class SetGearCommand implements CarCommand {
  final CarController controller;
  final int gear;

  SetGearCommand(this.controller, this.gear);

  @override
  void execute() {
    print(controller.setGear(gear));
  }
}

class SetSpeedCommand implements CarCommand {
  final CarController controller;
  final int speed;

  SetSpeedCommand(this.controller, this.speed);

  @override
  void execute() {
    print(controller.setSpeed(speed));
  }
}

class GetInfoCommand implements CarCommand {
  final CarController controller;

  GetInfoCommand(this.controller);

  @override
  void execute() {
    print(controller.getInfo());
  }
}