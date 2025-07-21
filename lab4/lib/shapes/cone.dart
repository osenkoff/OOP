import 'dart:math';
import 'bodies/body.dart';

class Cone extends Body {
  final double _radius;
  final double _height;

  Cone(this._radius, this._height, double density) : super(density) {
    if (_radius <= 0) throw ArgumentError('Radius must be positive');
    if (_height <= 0) throw ArgumentError('Height must be positive');
  }

  @override
  double getVolume() => (1 / 3) * pi * pow(_radius, 2) * _height;
}
