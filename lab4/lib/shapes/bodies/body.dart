import 'package:meta/meta.dart';

abstract class Body {
  final double _density;

  Body(this._density) {
    if (_density <= 0) throw ArgumentError('Плотность должна быть положительной.');
  }

  double getDensity() => _density;

  @mustBeOverridden
  double getVolume();

  double getMass() => getDensity() * getVolume();

  double getWeightInWater() {
    const double waterDensity = 1000;
    const double gravity = 9.81;

    return (getDensity() - waterDensity) * gravity * getVolume();
  }
}
