import 'dart:io';

import 'controller.dart';
import 'shapes/bodies/body.dart';

class ShapeParameters {
  final String type;
  final List<double> dimensions;
  final List<Body> bodiesToAdd;

  ShapeParameters(this.type, {this.dimensions = const [], this.bodiesToAdd = const []});
}

class EventLoop {
  final Controller controller = Controller();

  double _parseNumber(String prompt) {
    stdout.write('$prompt: ');
    final input = stdin.readLineSync()?.trim();

    if (input == null || input.isEmpty) {
      throw ArgumentError('Ошибка: "$prompt" не введён.');
    }

    final value = double.tryParse(input);
    if (value == null) {
      throw ArgumentError('Ошибка: "$prompt" должен быть числом.');
    }

    if (value <= 0) {
      throw ArgumentError('Ошибка: "$prompt" должен быть положительным.');
    }

    return value;
  }

  List<int> _parseIndices(String prompt) {
    stdout.write('$prompt (через запятую, или пустая строка для отмены): ');
    final input = stdin.readLineSync()?.trim();

    if (input == null || input.isEmpty) {
      return [];
    }

    final indices = input
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .map((e) => int.tryParse(e))
        .toList();

    if (indices.any((e) => e == null)) {
      throw ArgumentError('Ошибка: все индексы должны быть целыми числами.');
    }

    return indices.cast<int>();
  }

  ShapeParameters _parseShapeParameters(String action) {
    switch (action.toLowerCase()) {
      case 'sphere':
        final radius = _parseNumber('Радиус');
        final density = _parseNumber('Плотность');
        return ShapeParameters('sphere', dimensions: [radius, density]);

      case 'parallelepiped':
        final width = _parseNumber('Ширина');
        final height = _parseNumber('Высота');
        final depth = _parseNumber('Глубина');
        final density = _parseNumber('Плотность');
        return ShapeParameters('parallelepiped', dimensions: [width, height, depth, density]);

      case 'cylinder':
        final radius = _parseNumber('Радиус');
        final height = _parseNumber('Высота');
        final density = _parseNumber('Плотность');
        return ShapeParameters('cylinder', dimensions: [radius, height, density]);

      case 'cone':
        final radius = _parseNumber('Радиус');
        final height = _parseNumber('Высота');
        final density = _parseNumber('Плотность');
        return ShapeParameters('cone', dimensions: [radius, height, density]);

      case 'compound':
        if (controller.bodies.isEmpty) {
          throw ArgumentError('Ошибка: нет доступных тел для создания составного тела.');
        }

        print('Доступные тела:');
        for (int i = 0; i < controller.bodies.length; i++) {
          final body = controller.bodies[i];
          print('$i. ${body.runtimeType} (V=${body.getVolume().toStringAsFixed(2)}, m=${body.getMass().toStringAsFixed(2)})');
        }

        final indices = _parseIndices('Введите индексы тел');
        final bodiesToAdd = <Body>[];

        for (final index in indices) {
          if (index < 0 || index >= controller.bodies.length) {
            throw ArgumentError('Ошибка: индекс $index вне диапазона (0..${controller.bodies.length - 1}).');
          }
          bodiesToAdd.add(controller.bodies[index]);
        }

        return ShapeParameters('compound', bodiesToAdd: bodiesToAdd);

      case 'info':
        return ShapeParameters('info');

      case 'exit':
        return ShapeParameters('exit');

      default:
        throw ArgumentError('Ошибка: неизвестная команда "$action".');
    }
  }

  void executeAction() {
    print('Доступные команды: Sphere, Parallelepiped, Cylinder, Cone, Compound, Info, Exit');
    while (true) {
      stdout.write('Введите команду для создания фигуры: ');
      final action = stdin.readLineSync()?.trim();
      if (action == null || action.toLowerCase() == 'exit') {
        print('Выход из программы.');
        break;
      }

      try {
        final params = _parseShapeParameters(action);

        switch (params.type.toLowerCase()) {
          case 'sphere':
            controller.createSphere(params.dimensions[0], params.dimensions[1]);
            print('Сфера успешно создана!');
            break;

          case 'parallelepiped':
            controller.createParallelepiped(
              params.dimensions[0],
              params.dimensions[1],
              params.dimensions[2],
              params.dimensions[3],
            );
            print('Параллелепипед успешно создан!');
            break;

          case 'cylinder':
            controller.createCylinder(
              params.dimensions[0],
              params.dimensions[1],
              params.dimensions[2],
            );
            print('Цилиндр успешно создан!');
            break;

          case 'cone':
            controller.createCone(
              params.dimensions[0],
              params.dimensions[1],
              params.dimensions[2],
            );
            print('Конус успешно создан!');
            break;

          case 'compound':
            final compound = controller.createCompound(params.bodiesToAdd);
            if (compound != null) {
              print('Составное тело успешно создано!');
            }
            break;

          case 'info':
            controller.displayShapesInfo();
            break;
        }
      } catch (e) {
        print('Ошибка: $e');
      }
    }
  }
}
