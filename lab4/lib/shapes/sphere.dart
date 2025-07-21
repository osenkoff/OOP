import 'dart:math';

import 'bodies/body.dart';

class Sphere extends Body {
  final double _radius;

  Sphere(this._radius, double density) : super(density) {
    if (_radius <= 0) throw ArgumentError('Radius must be positive');
  }

  @override
  double getVolume() => (4 / 3) * pi * pow(_radius, 3);
}
