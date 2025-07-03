import 'dart:math';

import 'bodies/solid_body.dart';

class Cone extends SolidBody {
  final double _baseRadius;
  final double _height;

  double get baseRadius => _baseRadius;
  double get height => _height;

  Cone(double baseRadius, double height, super.density)
      : _baseRadius = baseRadius,
        _height = height;

  @override
  double getVolume() {
    return (1 / 3) * pi * pow(_baseRadius, 2) * _height;
  }
}
