abstract class MathematicalStrategy {
  double executeOperation(List<double> array);
}

class GetMinimalValueStrategy implements MathematicalStrategy {
  @override
  double executeOperation(List<double> array) =>
      array.reduce((current, next) => current < next ? current : next);
}

class GetMaximalValueStrategy implements MathematicalStrategy {
  @override
  double executeOperation(List<double> array) =>
      array.reduce((current, next) => current > next ? current : next);
}

class GetAverageValueStrategy implements MathematicalStrategy {
  @override
  double executeOperation(List<double> array) =>
      array.reduce((a, b) => a + b) / array.fold(0, (total, _) => total + 1);
}

class GetSumValueStrategy implements MathematicalStrategy {
  @override
  double executeOperation(List<double> array) => array.reduce((a, b) => a + b);
}

class GetLengthStrategy implements MathematicalStrategy {
  @override
  double executeOperation(List<double> array) =>
      array.fold(0, (total, _) => total + 1);
}
