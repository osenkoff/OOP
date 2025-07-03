import 'dart:io';

import 'controller.dart';

import 'shapes/actions/body_action.dart';

class EventLoop {
  final Controller controller = Controller();
  final BodyAction bodyAction = BodyAction(Controller());

  void executeAction() {
    print('Доступные команды: Sphere, Parallelepiped, Cylinder, Cone, Compound, Info, Exit');
    while (true) {
      stdout.write('Введите команду для создания фигуры: ');
      String? action = stdin.readLineSync()?.trim();
      if (action == null || action.toLowerCase() == 'exit') {
        print('Выход из программы.');
        break;
      }
      try {
        bodyAction.executeCommand(action);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}