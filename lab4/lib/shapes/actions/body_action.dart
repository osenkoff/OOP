import 'package:lab4/controller.dart';
import 'package:lab4/shapes/bodies/solid_body.dart';

import 'body_command.dart';

class BodyAction {
  final Controller controller;
  List<SolidBody> existingBodies = [];

  BodyAction(this.controller);

  void executeCommand(String action) {
    BodyCommand? receivedAction = _parseAction(action);
    if (receivedAction != null) {
      SolidBody? newBody = receivedAction.execute() as SolidBody?;
      if (newBody != null) {
        existingBodies.add(newBody);
        print('Создано тело: ${newBody.runtimeType} - Объём: ${newBody.getVolume().toStringAsFixed(2)}, Масса: ${newBody.getMass().toStringAsFixed(2)}');
      }
      return;
    }
    throw Exception('Недоступное действие');
  }

  BodyCommand? _parseAction(String command) {
    switch (command) {
      case 'Sphere':
        return CreateSphereCommand(controller);
      case 'Parallelepiped':
        return CreateParallelepipedCommand(controller);
      case 'Cylinder':
        return CreateCylinderCommand(controller);
      case 'Cone':
        return CreateConeCommand(controller);
      case 'Compound':
        return CreateCompoundCommand(controller, existingBodies);
      case 'Info':
        return InfoCommand(controller, existingBodies);
      default:
        return null;
    }
  }
}