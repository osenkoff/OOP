import 'package:lab4/controller.dart';
import 'package:lab4/shapes/bodies/body.dart';
import 'package:lab4/shapes/bodies/solid_body.dart';

abstract class BodyCommand {
  Body? execute();
}

class CreateSphereCommand extends BodyCommand {
  late final Controller controller;

  CreateSphereCommand(this.controller);

  @override
  Body? execute() {
    return controller.createSphere();
  }
}

class CreateParallelepipedCommand extends BodyCommand {
  late final Controller controller;

  CreateParallelepipedCommand(this.controller);

  @override
  Body? execute() {
    return controller.createParallelepiped();
  }
}

class CreateCylinderCommand extends BodyCommand {
  late final Controller controller;

  CreateCylinderCommand(this.controller);

  @override
  Body? execute() {
    return controller.createCylinder();
  }
}

class CreateConeCommand extends BodyCommand {
  late final Controller controller;

  CreateConeCommand(this.controller);

  @override
  Body? execute() {
    return controller.createCone();
  }
}

class CreateCompoundCommand extends BodyCommand {
  late final Controller controller;
  late final List<SolidBody> existingBodies;

  CreateCompoundCommand(this.controller, this.existingBodies);

  @override
  Body? execute() {
    return controller.createCompound(existingBodies);
  }
}

class InfoCommand extends BodyCommand {
  late final Controller controller;
  late final List<SolidBody> bodies;

  InfoCommand(this.controller, this.bodies);

  @override
  Body? execute() {
    return controller.getShapesInfo(bodies);
  }
}