import 'package:lab4/controller.dart';
import 'package:lab4/shapes/compound.dart';
import 'package:lab4/shapes/cone.dart';
import 'package:lab4/shapes/cylinder.dart';
import 'package:lab4/shapes/sphere.dart';
import 'package:lab4/shapes/parallelepiped.dart';
import 'package:test/test.dart';

void main() {
  late Controller controller;

  setUp(() {
    controller = Controller();
  });

  group('Controller Tests', () {
    group('Sphere', () {
      test('Valid sphere should calculate volume, mass and weight in water', () {
        final sphere = Sphere(1.0, 2000.0);
        expect(sphere.getVolume(), closeTo(4.188790204786391, 1e-6));
        expect(sphere.getMass(), closeTo(8377.580409572782, 1e-6));
        expect(sphere.getWeightInWater(), closeTo(41092.03, 0.01));
      });
    });

    group('Parallelepiped', () {
      test('Valid parallelepiped should calculate correctly', () {
        final parallelepiped = Parallelepiped(2.0, 2.0, 2.0, 1500.0);
        expect(parallelepiped.getVolume(), 8.0);
        expect(parallelepiped.getMass(), 12000.0);
        expect(parallelepiped.getWeightInWater(), closeTo(39240.0, 1e-6));
      });
    });

    group('Cylinder', () {
      test('Valid cylinder should calculate correctly', () {
        final cylinder = Cylinder(1.0, 2.0, 1000.0);
        expect(cylinder.getVolume(), closeTo(6.283185307179586, 1e-7));
        expect(cylinder.getMass(), closeTo(6283.185307179586, 1e-6));
        expect(cylinder.getWeightInWater(), closeTo(0.0, 1e-6));
      });
    });

    group('Cone', () {
      test('Valid cone should calculate correctly', () {
        final cone = Cone(1.0, 2.0, 1200.0);
        expect(cone.getVolume(), closeTo(2.0943951023931953, 1e-7));
        expect(cone.getMass(), closeTo(2513.2741228718344, 1e-6));
        expect(cone.getWeightInWater(), closeTo(4109.203, 1e-3));
      });
    });

    group('Compound', () {
      test('Compound should aggregate volume, mass and weight in water', () {
        final sphere = Sphere(1.0, 2000.0);
        final p = Parallelepiped(2.0, 2.0, 2.0, 1500.0);
        final compound = Compound(0);
        compound.addChildBody(sphere);
        compound.addChildBody(p);

        expect(compound.getVolume(), closeTo(12.188790204786391, 1e-7));
        expect(compound.getMass(), closeTo(20377.580409572782, 1e-6));
        expect(compound.getWeightInWater(), greaterThan(0));
      });

      test('Should prevent cyclic dependencies', () {
        final compound1 = Compound(0);
        final compound2 = Compound(0);
        compound1.addChildBody(compound2);
        expect(compound1.addChildBody(compound1), isFalse);
      });
    });

    group('Body Search Functions', () {
      test('findMaxMassBody returns the body with highest mass', () {
        final cylinder = Cylinder(2.0, 3.0, 1000.0);
        final cone = Cone(2.0, 3.0, 800.0);

        final bodies = [cylinder, cone];
        final result = controller.findMaxMassBody(bodies);

        expect(result, isA<Cylinder>());
        expect(result.getMass(), closeTo(37699.1, 0.1));
      });

      test('findMaxMassBody throws on empty list', () {
        expect(() => controller.findMaxMassBody([]), throwsException);
      });

      test('findMinWeightInWater returns correct body', () {
        final lightSphere = Sphere(1.0, 500.0);
        final heavyCone = Cone(2.0, 3.0, 2000.0);

        final result = controller.findMinWeightInWater([lightSphere, heavyCone]);

        expect(result, isA<Sphere>());
        expect(result.getWeightInWater(), lessThan(0));
      });

      test('findMinWeightInWater throws on empty list', () {
        expect(() => controller.findMinWeightInWater([]), throwsException);
      });
    });
  });
}
