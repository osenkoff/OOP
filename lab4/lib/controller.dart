import 'package:lab4/shapes/bodies/body.dart';
import 'package:lab4/shapes/compound.dart';
import 'package:lab4/shapes/sphere.dart';
import 'package:lab4/shapes/parallelepiped.dart';
import 'package:lab4/shapes/cylinder.dart';
import 'package:lab4/shapes/cone.dart';

class Controller {
  final List<Body> _bodies = [];

  List<Body> get bodies => List.unmodifiable(_bodies);

  Body createSphere(double radius, double density) {
    final sphere = Sphere(radius, density);
    _bodies.add(sphere);
    return sphere;
  }

  Body createParallelepiped(
      double width, double height, double depth, double density) {
    final parallelepiped = Parallelepiped(width, height, depth, density);
    _bodies.add(parallelepiped);
    return parallelepiped;
  }

  Body createCylinder(double radius, double height, double density) {
    final cylinder = Cylinder(radius, height, density);
    _bodies.add(cylinder);
    return cylinder;
  }

  Body createCone(double radius, double height, double density) {
    final cone = Cone(radius, height, density);
    _bodies.add(cone);
    return cone;
  }

  Compound? createCompound(List<Body> bodiesToAdd) {
    if (bodiesToAdd.isEmpty) {
      print('Не указаны тела для создания составного тела.');
      return null;
    }

    final compound = Compound(0);
    bool addedAny = false;

    for (final body in bodiesToAdd) {
      if (!_bodies.contains(body)) {
        print('Предупреждение: Тело $body не управляется контроллером.');
        continue;
      }

      if (compound.addChildBody(body)) {
        print('Тело ${body.runtimeType} успешно добавлено.');
        addedAny = true;
      } else {
        print(
            'Ошибка: Не удалось добавить ${body.runtimeType} из-за циклической зависимости.');
      }
    }

    if (addedAny) {
      _bodies.add(compound);
      return compound;
    }

    return null;
  }

  void displayShapesInfo() {
    if (_bodies.isEmpty) {
      print('Нет доступных тел.');
      return;
    }

    print('Информация о телах:');
    for (var body in _bodies) {
      print(
          '${body.runtimeType} - Объём: ${body.getVolume().toStringAsFixed(2)}, Масса: ${body.getMass().toStringAsFixed(2)}, Вес в воде: ${body.getWeightInWater().toStringAsFixed(2)}');
    }

    if (_bodies.length > 1) {
      try {
        final maxMassBody = findMaxMassBody();
        print(
            'Тело с наибольшей массой: ${maxMassBody.runtimeType} - Объём: ${maxMassBody.getVolume().toStringAsFixed(2)}, Масса: ${maxMassBody.getMass().toStringAsFixed(2)}, Вес в воде: ${maxMassBody.getWeightInWater().toStringAsFixed(2)}');
      } catch (e) {
        print('Ошибка при поиске тела с наибольшей массой: $e');
      }

      try {
        final minWaterWeightBody = findMinWeightInWater();
        print(
            'Тело с минимальным весом в воде: ${minWaterWeightBody.runtimeType} - Объём: ${minWaterWeightBody.getVolume().toStringAsFixed(2)}, Масса: ${minWaterWeightBody.getMass().toStringAsFixed(2)}, Вес в воде: ${minWaterWeightBody.getWeightInWater().toStringAsFixed(2)}');
      } catch (e) {
        print('Ошибка при поиске тела с минимальным весом в воде: $e');
      }
    }
  }

  Body findMaxMassBody() {
    if (_bodies.isEmpty) throw ArgumentError("Список тел пуст.");
    return _bodies.reduce((a, b) => a.getMass() > b.getMass() ? a : b);
  }

  Body findMinWeightInWater() {
    if (_bodies.isEmpty) throw ArgumentError("Список тел пуст.");
    return _bodies
        .reduce((a, b) => a.getWeightInWater() < b.getWeightInWater() ? a : b);
  }
}
