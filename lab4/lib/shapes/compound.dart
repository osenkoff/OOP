import 'bodies/body.dart';

class Compound extends Body {
  final List<Body> _children = [];

  Compound(super.density);

  bool addChildBody(Body child) {
    if (child == this || _wouldCauseCycle(child)) {
      return false;
    }
    _children.add(child);
    return true;
  }

  List<Body> getChildBodies() => List.unmodifiable(_children);

  bool _wouldCauseCycle(Body child) {
    if (child is! Compound) return false;

    final visited = <Body>{};
    final stack = <Body>[child];

    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      if (visited.contains(current)) continue;
      visited.add(current);

      if (current == this) return true;

      if (current is Compound) {
        stack.addAll(current.getChildBodies());
      }
    }

    return false;
  }

  @override
  double getVolume() =>
      _children.map((b) => b.getVolume()).fold(0.0, (a, b) => a + b);

  @override
  double getMass() =>
      _children.map((b) => b.getMass()).fold(0.0, (a, b) => a + b);

  @override
  double getDensity() => getVolume() > 0 ? getMass() / getVolume() : 0;
}
