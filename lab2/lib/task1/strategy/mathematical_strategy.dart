abstract class MathematicalStrategy {
  double min(List<double> array);

  double max(List<double> array);

  double average(List<double> array);

  double sum(List<double> array);

  double length(List<double> array);
}

class ExecuteOperationStrategy implements MathematicalStrategy {
  @override
  double min(List<double> array) =>
      array.reduce((current, next) => current < next ? current : next);

  @override
  double max(List<double> array) =>
      array.reduce((current, next) => current > next ? current : next);

  @override
  double average(List<double> array) =>
      array.reduce((a, b) => a + b) / array.fold(0, (total, _) => total + 1);

  @override
  double sum(List<double> array) => array.reduce((a, b) => a + b);

  @override
  double length(List<double> array) => array.fold(0, (total, _) => total + 1);
}
