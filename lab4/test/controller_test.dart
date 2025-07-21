import 'package:test/test.dart';
import 'package:lab4/controller.dart';

void main() {
  group('Controller test', () {
    late Controller controller;

    setUp(() {
      controller = Controller();
    });

    test('Create a sphere', () {
      final sphere = controller.createSphere(1.0, 2000.0);
      expect(sphere.getVolume(), closeTo(4.18879, 1e-5));
      expect(controller.bodies.contains(sphere), isTrue);
    });

    test('Create a parallelepiped', () {
      final parallelepiped = controller.createParallelepiped(2.0, 2.0, 2.0, 1500.0);
      expect(parallelepiped.getVolume(), 8.0);
      expect(controller.bodies.contains(parallelepiped), isTrue);
    });

    test('Create a cylinder', () {
      final cylinder = controller.createCylinder(1.0, 2.0, 1000.0);
      expect(cylinder.getVolume(), closeTo(6.28319, 1e-5));
    });

    test('Create a cone', () {
      final cone = controller.createCone(1.0, 2.0, 1200.0);
      expect(cone.getVolume(), closeTo(2.09439, 1e-5));
    });

    test('findMaxMassBody returns the body with the highest mass', () {
      controller.createSphere(1.0, 1000.0);
      final heavyBox = controller.createParallelepiped(2.0, 2.0, 2.0, 1500.0);

      final maxMass = controller.findMaxMassBody();
      expect(maxMass, heavyBox);
    });

    test('findMinWeightInWater returns the body with the lowest weight in water', () {
      controller.createSphere(1.0, 2000.0);
      final lighter = controller.createCylinder(1.0, 2.0, 1000.0);

      final minWeight = controller.findMinWeightInWater();
      expect(minWeight, lighter);
    });

    test('findMaxMassBody throws exception, if it`s no bodies exist', () {
      expect(() => controller.findMaxMassBody(), throwsArgumentError);
    });

    test('findMinWeightInWater throws exception, if it`s no bodies exist', () {
      expect(() => controller.findMinWeightInWater(), throwsArgumentError);
    });
  });
}
