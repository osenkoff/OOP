import 'bodies/body.dart';

class Parallelepiped extends Body {
  final double _width;
  final double _height;
  final double _depth;

  double get width => _width;
  double get height => _height;
  double get depth => _depth;

  Parallelepiped(double width, double height, double depth, super.density)
      :
        _width = width,
        _height = height,
        _depth = depth;

  @override
  double getVolume() {
    return _width * _height * _depth;
  }
}