import 'dart:math';

import 'bodies/body.dart';

class Sphere extends Body {
  final double _radius;

  double get radius => _radius;

  Sphere(double radius, super.density) : _radius = radius;

  @override
  double getVolume() {
    return (4 / 3) * pi * pow(_radius, 3);
  }
}
