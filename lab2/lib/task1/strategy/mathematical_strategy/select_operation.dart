import 'mathematical_strategy.dart';

class SelectOperation {
  MathematicalStrategy? _mathematicalStrategy;

  void setOperation(MathematicalStrategy mathematicalStrategy) {
    _mathematicalStrategy = mathematicalStrategy;
  }

  double execute(List<double> array) {
    if (_mathematicalStrategy == null) {
      throw StateError('No operation set');
    }

    return _mathematicalStrategy!.executeOperation(array);
  }
}