import 'package:meta/meta.dart';

abstract class Body {
  final double _density;

  Body(double density): _density = density;

  @mustBeOverridden
  double getVolume();
  double getMass() => _density * getVolume();

  double getWeightInWater() {
    const double waterDensity = 1000;
    const double gravity = 9.81;

    return (getMass() - waterDensity * getVolume()) * gravity;
  }
}