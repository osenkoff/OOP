import 'package:lab4/shapes/compound.dart';
import 'package:lab4/shapes/cone.dart';
import 'package:lab4/shapes/cylinder.dart';
import 'package:lab4/shapes/parallelepiped.dart';
import 'package:lab4/shapes/sphere.dart';
import 'package:test/test.dart';

void main() {
  group('Shapes test', () {
    group('Sphere', () {
      test('Valid sphere created', () {
        final sphere = Sphere(1.0, 2000.0);
        expect(sphere.getVolume(), closeTo(4.18879, 1e-5));
        expect(sphere.getMass(), closeTo(8377.58, 1e-2));
        expect(sphere.getWeightInWater(), closeTo(41092.03, 0.01));
      });

      test('Negative radius throws ArgumentError', () {
        expect(() => Sphere(-1.0, 2000.0), throwsArgumentError);
      });

      test('Negative density throws ArgumentError', () {
        expect(() => Sphere(1.0, -2000.0), throwsArgumentError);
      });
    });

    group('Parallelepiped', () {
      test('Valid parallelepiped created', () {
        final parallelepiped = Parallelepiped(2.0, 2.0, 2.0, 1500.0);
        expect(parallelepiped.getVolume(), 8.0);
        expect(parallelepiped.getMass(), 12000.0);
        expect(parallelepiped.getWeightInWater(), closeTo(39240.0, 1e-6));
      });

      test('Negative dimensions throws ArgumentsError', () {
        expect(
            () => Parallelepiped(-2.0, 2.0, 2.0, 1500.0), throwsArgumentError);
        expect(
            () => Parallelepiped(2.0, -2.0, 2.0, 1500.0), throwsArgumentError);
        expect(
            () => Parallelepiped(2.0, 2.0, -2.0, 1500.0), throwsArgumentError);
      });

      test('Negative density throws ArgumentsError', () {
        expect(
            () => Parallelepiped(2.0, 2.0, 2.0, -1500.0), throwsArgumentError);
      });
    });

    group('Cylinder', () {
      test('Valid cylinder created', () {
        final cylinder = Cylinder(1.0, 2.0, 1000.0);
        expect(cylinder.getVolume(), closeTo(6.28319, 1e-5));
        expect(cylinder.getMass(), closeTo(6283.19, 1e-2));
        expect(cylinder.getWeightInWater(), closeTo(0.0, 1e-6));
      });

      test('Invalid dimensions throws ArgumentError', () {
        expect(() => Cylinder(-1.0, 2.0, 1000.0), throwsArgumentError);
        expect(() => Cylinder(1.0, -2.0, 1000.0), throwsArgumentError);
      });

      test('Negative density throws ArgumentError', () {
        expect(() => Cylinder(1.0, 2.0, -1000.0), throwsArgumentError);
      });
    });

    group('Cone', () {
      test('Valid cone created', () {
        final cone = Cone(1.0, 2.0, 1200.0);
        expect(cone.getVolume(), closeTo(2.09439, 1e-5));
        expect(cone.getMass(), closeTo(2513.27, 1e-2));
        expect(cone.getWeightInWater(), closeTo(4109.203, 1e-3));
      });

      test('Invalid dimensions throws ArgumentsError', () {
        expect(() => Cone(-1.0, 2.0, 1200.0), throwsArgumentError);
        expect(() => Cone(1.0, -2.0, 1200.0), throwsArgumentError);
      });

      test('Negative density throws ArgumentsError', () {
        expect(() => Cone(1.0, 2.0, -1200.0), throwsArgumentError);
      });
    });

    group('Compound', () {
      test('Valid compound body created', () {
        final compound = Compound(1000);
        compound.addChildBody(Sphere(1.0, 2000.0));
        compound.addChildBody(Parallelepiped(2.0, 2.0, 2.0, 1500.0));

        expect(compound.getVolume(), closeTo(12.18879, 1e-5));
        expect(compound.getMass(), closeTo(20377.58, 1e-2));
        expect(compound.getWeightInWater(), greaterThan(0));
      });

      test('Detected cycle in compound', () {
        final c1 = Compound(1000);
        final c2 = Compound(1000);
        final c3 = Compound(1000);

        c1.addChildBody(c2);
        c2.addChildBody(c3);

        expect(c3.addChildBody(c1), isFalse);
      });
    });
  });
}
