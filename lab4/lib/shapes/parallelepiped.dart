import 'bodies/body.dart';

class Parallelepiped extends Body {
  final double _width;
  final double _height;
  final double _depth;

  Parallelepiped(this._width, this._height, this._depth, double density) : super(density) {
    if (_width <= 0) throw ArgumentError('Width must be positive');
    if (_height <= 0) throw ArgumentError('Height must be positive');
    if (_depth <= 0) throw ArgumentError('Depth must be positive');
  }

  @override
  double getVolume() => _width * _height * _depth;
}
