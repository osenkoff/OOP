import 'package:lab4/controller.dart';
import 'package:lab4/shapes/compound.dart';
import 'package:lab4/shapes/cylinder.dart';
import 'package:lab4/shapes/sphere.dart';
import 'package:test/test.dart';

void main() {
  late Controller controller;

  setUp(() {
    controller = Controller();
  });

  group('Shapes test', () {
    group('Sphere', () {
      test('Valid sphere should calculate volume, mass and weight in water', () {
        final sphere = controller.createSphere(1.0, 2000.0);
        expect(sphere.getVolume(), closeTo(4.188790204786391, 1e-6));
        expect(sphere.getMass(), closeTo(8377.580409572782, 1e-6));
        expect(sphere.getWeightInWater(), closeTo(41092.03, 0.01));
      });

      test('Negative radius should throw ArgumentError', () {
        expect(
              () => controller.createSphere(-1.0, 2000.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Радиус должен быть положительным.')),
        );
      });

      test('Negative density should throw ArgumentError', () {
        expect(
              () => controller.createSphere(1.0, -2000.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Плотность должна быть положительной.')),
        );
      });
    });

    group('Parallelepiped', () {
      test('Valid parallelepiped should calculate correctly', () {
        final parallelepiped = controller.createParallelepiped(2.0, 2.0, 2.0, 1500.0);
        expect(parallelepiped.getVolume(), 8.0);
        expect(parallelepiped.getMass(), 12000.0);
        expect(parallelepiped.getWeightInWater(), closeTo(39240.0, 1e-6));
      });

      test('Negative dimension should throw ArgumentError', () {
        expect(
              () => controller.createParallelepiped(-2.0, 2.0, 2.0, 1500.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Все размеры должны быть положительными.')),
        );
      });

      test('Negative density should throw ArgumentError', () {
        expect(
              () => controller.createParallelepiped(2.0, 2.0, 2.0, -1500.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Плотность должна быть положительной.')),
        );
      });
    });

    group('Cylinder', () {
      test('Valid cylinder should calculate correctly', () {
        final cylinder = controller.createCylinder(1.0, 2.0, 1000.0);
        expect(cylinder.getVolume(), closeTo(6.283185307179586, 1e-7));
        expect(cylinder.getMass(), closeTo(6283.185307179586, 1e-6));
        expect(cylinder.getWeightInWater(), closeTo(0.0, 1e-6));
      });

      test('Negative radius should throw ArgumentError', () {
        expect(
              () => controller.createCylinder(-1.0, 2.0, 1000.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Радиус и высота должны быть положительными.')),
        );
      });

      test('Negative height should throw ArgumentError', () {
        expect(
              () => controller.createCylinder(1.0, -2.0, 1000.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Радиус и высота должны быть положительными.')),
        );
      });

      test('Negative density should throw ArgumentError', () {
        expect(
              () => controller.createCylinder(1.0, 2.0, -1000.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Плотность должна быть положительной.')),
        );
      });
    });

    group('Cone', () {
      test('Valid cone should calculate correctly', () {
        final cone = controller.createCone(1.0, 2.0, 1200.0);
        expect(cone.getVolume(), closeTo(2.0943951023931953, 1e-7));
        expect(cone.getMass(), closeTo(2513.2741228718344, 1e-6));
        expect(cone.getWeightInWater(), closeTo(4109.203, 1e-3));
      });

      test('Negative radius should throw ArgumentError', () {
        expect(
              () => controller.createCone(-1.0, 2.0, 1200.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Радиус и высота должны быть положительными.')),
        );
      });

      test('Negative height should throw ArgumentError', () {
        expect(
              () => controller.createCone(1.0, -2.0, 1200.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Радиус и высота должны быть положительными.')),
        );
      });

      test('Negative density should throw ArgumentError', () {
        expect(
              () => controller.createCone(1.0, 2.0, -1200.0),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Плотность должна быть положительной.')),
        );
      });
    });

    group('Compound', () {
      test('Compound should aggregate volume, mass, and weight in water', () {
        final sphere = controller.createSphere(1.0, 2000.0);
        final parallelepiped = controller.createParallelepiped(2.0, 2.0, 2.0, 1500.0);
        final compound = Compound();
        compound.addChildBody(sphere);
        compound.addChildBody(parallelepiped);

        expect(compound.getVolume(), closeTo(12.188790204786391, 1e-7));
        expect(compound.getMass(), closeTo(20377.580409572782, 1e-6));
        expect(compound.getWeightInWater(), greaterThan(0));
      });

      test('createCompound with valid indices should create compound', () {
        controller.createSphere(1.0, 2000.0);
        controller.createParallelepiped(2.0, 2.0, 2.0, 1500.0);
        final compound = controller.createCompound([0, 1]);

        expect(compound, isNotNull);
        expect(compound!.getVolume(), closeTo(12.188790204786391, 1e-7));
        expect(compound.getMass(), closeTo(20377.580409572782, 1e-6));
      });

      test('createCompound with empty indices should return null', () {
        controller.createSphere(1.0, 2000.0);
        final compound = controller.createCompound([]);
        expect(compound, isNull);
      });

      test('createCompound with invalid index should skip invalid index', () {
        controller.createSphere(1.0, 2000.0);
        final compound = controller.createCompound([0, 999]);
        expect(compound, isNotNull);
        expect(compound!.getVolume(), closeTo(4.188790204786391, 1e-7));
      });

      test('Should prevent cyclic dependencies (direct)', () {
        final compound1 = Compound();
        final compound2 = Compound();
        compound1.addChildBody(compound2);
        expect(compound2.addChildBody(compound1), isFalse);
      });

      test('Should prevent cyclic dependencies (nested)', () {
        final compound1 = Compound();
        final compound2 = Compound();
        final compound3 = Compound();
        compound1.addChildBody(compound2);
        compound2.addChildBody(compound3);
        expect(compound3.addChildBody(compound1), isFalse);
      });
    });

    group('Body Search Functions', () {
      test('findMaxMassBody returns the body with highest mass', () {
        controller.createCylinder(2.0, 3.0, 1000.0);
        controller.createCone(2.0, 3.0, 800.0);
        final result = controller.findMaxMassBody();

        expect(result, isA<Cylinder>());
        expect(result.getMass(), closeTo(37699.1, 0.1));
      });

      test('findMaxMassBody throws ArgumentError on empty list', () {
        expect(
              () => controller.findMaxMassBody(),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Список тел пуст.')),
        );
      });

      test('findMinWeightInWater returns correct body', () {
        controller.createSphere(1.0, 500.0);
        controller.createCone(2.0, 3.0, 2000.0);
        final result = controller.findMinWeightInWater();

        expect(result, isA<Sphere>());
        expect(result.getWeightInWater(), lessThan(0));
      });

      test('findMinWeightInWater throws ArgumentError on empty list', () {
        expect(
              () => controller.findMinWeightInWater(),
          throwsA(isA<ArgumentError>().having(
                  (e) => e.message, 'message', 'Список тел пуст.')),
        );
      });
    });
  });
}