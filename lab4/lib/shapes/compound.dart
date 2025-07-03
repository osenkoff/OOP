import 'bodies/solid_body.dart';

class Compound extends SolidBody {
  final List<SolidBody> _children = [];

  Compound(super.density);

  @override
  double getVolume() => _children.map((b) => b.getVolume()).fold(0, (a, b) => a + b);

  @override
  double getMass() => _children.map((b) => b.getMass()).fold(0, (a, b) => a + b);

  double getAverageDensity() => getMass() / getVolume();

  bool addChildBody(SolidBody child) {
    if (child == this || _hasCycle(this, child)) return false;
    _children.add(child);
    return true;
  }

  bool _hasCycle(Compound parent, SolidBody child) {
    if (child == parent) return true;
    if (child is! Compound) return false;

    for (final subChild in child._children) {
      if (_hasCycle(parent, subChild)) return true;
    }
    return false;
  }

  @override
  double getWeightInWater() {
    const double waterDensity = 1000;
    const double gravity = 9.81;
    double averageDensity = getAverageDensity();
    return (averageDensity - waterDensity) * getVolume() * gravity;
  }
}