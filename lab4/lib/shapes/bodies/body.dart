abstract class Body {
  double _density;
  double get density => _density;
  set density(double value) => _density = value;

  Body(this._density);

  double getVolume();
  double getMass() => _density * getVolume();

  double getWeightInWater() {
    const double waterDensity = 1000;
    const double gravity = 9.81;

    return (getMass() - waterDensity * getVolume()) * gravity;
  }
}