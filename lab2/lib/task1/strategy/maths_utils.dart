class MathsUtils {
  static double min(List<double> array) =>
      array.reduce((current, next) => current < next ? current : next);

  static double max(List<double> array) =>
      array.reduce((current, next) => current > next ? current : next);

  static double average(List<double> array) =>
      array.reduce((a, b) => a + b) / array.fold(0, (total, _) => total + 1);

  static double sum(List<double> array) => array.reduce((a, b) => a + b);
}
