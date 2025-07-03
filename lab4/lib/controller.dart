import 'dart:io';

import 'package:lab4/shapes/compound.dart';

import 'shapes/sphere.dart';
import 'shapes/parallelepiped.dart';
import 'shapes/cylinder.dart';
import 'shapes/cone.dart';
import 'shapes/bodies/solid_body.dart';

class Controller {
  List<String> _inputLines = [];
  int _inputIndex = 0;

  void setInputLines(List<String> lines) {
    _inputLines = lines;
    _inputIndex = 0;
  }

  String _readLine() {
    if (_inputIndex >= _inputLines.length) {
      throw Exception("Недостаточно входных данных");
    }

    return _inputLines[_inputIndex++].trim();
  }

  double _parseInput(String prompt) {
    final line = _readLine();
    final value = double.tryParse(line);
    if (value == null) {
      throw ArgumentError('Ошибка: "$prompt" должен быть числом.');
    }
    return value;
  }

  SolidBody createSphere() {
    final radius = _parseInput("Радиус");
    final density = _parseInput("Плотность");

    if (radius <= 0) throw ArgumentError("Радиус должен быть положительным.");

    if (density <= 0) {
      throw ArgumentError("Плотность должна быть положительной.");
    }

    return Sphere(radius, density);
  }

  SolidBody createParallelepiped() {
    final width = _parseInput("Ширина");
    final height = _parseInput("Высота");
    final depth = _parseInput("Глубина");
    final density = _parseInput("Плотность");

    if (width <= 0 || height <= 0 || depth <= 0) {
      throw ArgumentError("Все размеры должны быть положительными.");
    }

    if (density <= 0) {
      throw ArgumentError("Плотность должна быть положительной.");
    }

    return Parallelepiped(width, height, depth, density);
  }

  SolidBody createCylinder() {
    final radius = _parseInput("Радиус");
    final height = _parseInput("Высота");
    final density = _parseInput("Плотность");

    if (radius <= 0 || height <= 0) {
      throw ArgumentError("Радиус и высота должны быть положительными.");
    }

    if (density <= 0) {
      throw ArgumentError("Плотность должна быть положительной.");
    }

    return Cylinder(radius, height, density);
  }

  SolidBody createCone() {
    final radius = _parseInput("Радиус");
    final height = _parseInput("Высота");
    final density = _parseInput("Плотность");

    if (radius <= 0 || height <= 0) {
      throw ArgumentError("Радиус и высота должны быть положительными.");
    }

    if (density <= 0) {
      throw ArgumentError("Плотность должна быть положительной.");
    }

    return Cone(radius, height, density);
  }

  Compound? createCompound(List<SolidBody> existingBodies) {
    if (existingBodies.isEmpty) {
      print('Нет существующих тел для добавления!');
      return null;
    }

    print('\nСоздание составного тела:');
    final compound = Compound(0);

    print('Доступные тела:');
    for (int i = 0; i < existingBodies.length; i++) {
      final body = existingBodies[i];
      print(
          '$i. ${body.runtimeType} (V=${body.getVolume().toStringAsFixed(2)}, m=${body.getMass().toStringAsFixed(2)})');
    }

    bool addedAny = false;
    while (true) {
      stdout.write(
          'Введите индекс тела для добавления (или "exit" для завершения): ');
      final input = _inputLines.isNotEmpty == true
          ? _inputLines.removeAt(0)
          : stdin.readLineSync()?.trim();

      if (input?.toLowerCase() == 'exit') break;

      if (input == null || input.isEmpty) {
        print('Ошибка: введите индекс или "exit"');
        continue;
      }

      final index = int.tryParse(input);
      if (index == null) {
        print('Ошибка: введите целое число или "exit"');
        continue;
      }

      if (index < 0 || index >= existingBodies.length) {
        print(
            'Ошибка: индекс должен быть от 0 до ${existingBodies.length - 1}');
        continue;
      }

      final bodyToAdd = existingBodies[index];
      if (compound.addChildBody(bodyToAdd)) {
        print('Тело успешно добавлено!');
        addedAny = true;
      } else {
        print('Ошибка: обнаружена циклическая зависимость!');
      }
    }

    return addedAny ? compound : null;
  }

  SolidBody? getShapesInfo(final List<SolidBody> bodies) {
    if (bodies.isEmpty) {
      print('Нет доступных тел.');
      return null;
    }

    print('Информация о телах:');
    for (var body in bodies) {
      print(
          '${body.runtimeType} - Объём: ${body.getVolume().toStringAsFixed(2)}, Масса: ${body.getMass().toStringAsFixed(2)}, Вес в воде: ${body.getWeightInWater().toStringAsFixed(2)}');
    }
    if (bodies.length > 1) {
      try {
        final maxMassBody = findMaxMassBody(bodies);
        print(
            'Тело с наибольшей массой: ${maxMassBody.runtimeType} - Объём: ${maxMassBody.getVolume().toStringAsFixed(2)}, Масса: ${maxMassBody.getMass().toStringAsFixed(2)}, Вес в воде: ${maxMassBody.getWeightInWater().toStringAsFixed(2)}');
      } catch (e) {
        print('Ошибка при поиске тела с наибольшей массой: $e');
      }
      try {
        final minWaterWeightBody = findMinWeightInWater(bodies);
        print(
            'Тело с минимальным весом в воде: ${minWaterWeightBody.runtimeType} - Объём: ${minWaterWeightBody.getVolume().toStringAsFixed(2)}, Масса: ${minWaterWeightBody.getMass().toStringAsFixed(2)}, Вес в воде: ${minWaterWeightBody.getWeightInWater().toStringAsFixed(2)}');
      } catch (e) {
        print('Ошибка при поиске тела с минимальным весом в воде: $e');
      }
    }
    return null;
  }

  SolidBody findMaxMassBody(List<SolidBody> bodies) {
    if (bodies.isEmpty) throw Exception("Список тел пуст.");
    return bodies.reduce((a, b) => a.getMass() > b.getMass() ? a : b);
  }

  SolidBody findMinWeightInWater(List<SolidBody> bodies) {
    if (bodies.isEmpty) throw Exception("Список тел пуст.");
    return bodies
        .reduce((a, b) => a.getWeightInWater() < b.getWeightInWater() ? a : b);
  }
}
