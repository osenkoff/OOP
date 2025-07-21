import 'dart:math';
import 'bodies/body.dart';

class Cylinder extends Body {
  final double _radius;
  final double _height;

  Cylinder(this._radius, this._height, double density) : super(density) {
    if (_radius <= 0) throw ArgumentError('Radius must be positive');
    if (_height <= 0) throw ArgumentError('Height must be positive');
  }

  @override
  double getVolume() => pi * _radius * _radius * _height;
}
