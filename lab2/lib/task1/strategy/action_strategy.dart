import 'package:collection/collection.dart';

import 'maths_utils.dart';

abstract class ActionStrategy {
  List<double> execute(List<double> array);
}

class PositiveAverageStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    List<double> positiveNumbers = array.where((elem) => elem > 0).toList();
    if (positiveNumbers.isEmpty) {
      return array;
    } else {
      double averageNumber = MathsUtils.average(positiveNumbers);

      final result = array
          .map((elem) =>
              MathsUtils.truncateToDecimalPlaces(elem + averageNumber, 3))
          .toList();
      return result;
    }
  }
}

class MultiplyByMinValueStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    double minimalNumber = MathsUtils.min(array);

    final result = array
        .map((elem) =>
            MathsUtils.truncateToDecimalPlaces(elem * minimalNumber, 3))
        .toList();
    return result;
  }
}

class TripleDivisibleAverageStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    List<double> evenNumbers = array.where((elem) => elem % 2 == 0).toList();

    double averageNumber = 0;
    if (evenNumbers.isNotEmpty) {
      averageNumber = MathsUtils.average(evenNumbers);

      final result = array
          .map((elem) => (elem % 3 == 0)
              ? MathsUtils.truncateToDecimalPlaces(elem * averageNumber, 3)
              : MathsUtils.truncateToDecimalPlaces(elem, 3))
          .toList();
      return result;
    } else {
      return array;
    }
  }
}

class DivisionByMaxHalfStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    double halfOfMaximalNumber = (MathsUtils.max(array)) / 2;

    final result = array
        .map((elem) => halfOfMaximalNumber == 0
            ? 0.0
            : MathsUtils.truncateToDecimalPlaces(elem / halfOfMaximalNumber, 3))
        .toList();

    return result;
  }
}

class MultiplyByMinMaxStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    double minimalValue = MathsUtils.min(array);
    double maximalValue = MathsUtils.max(array);

    double minMaxMultiple = minimalValue * maximalValue;

    final result = array
        .map((elem) => (elem < 0)
            ? MathsUtils.truncateToDecimalPlaces(elem * minMaxMultiple, 3)
            : MathsUtils.truncateToDecimalPlaces(elem, 3))
        .toList();
    return result;
  }
}

class MultiplyMaxDivMinStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');

    double minimalValue = MathsUtils.min(array);
    double maximalValue = MathsUtils.max(array);

    final result = array
        .map((elem) => minimalValue == 0
            ? 0.0
            : MathsUtils.truncateToDecimalPlaces(
                elem * maximalValue / minimalValue, 3))
        .toList();

    return result;
  }
}

class SumOfThreeMinValuesStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) throw Exception('Empty array');
    if (array.length < 3) throw Exception('Not enough elements');

    List<double> sortedArray = array.sorted((a, b) => a.compareTo(b));
    List<double> threeLowestNumbers = sortedArray.take(3).toList();
    double sumOfThreeLowestNumbers = MathsUtils.sum(threeLowestNumbers);

    final result = array
        .map((elem) => MathsUtils.truncateToDecimalPlaces(
            elem + sumOfThreeLowestNumbers, 3))
        .toList();
    return result;
  }
}

class EvenMultiplyOddReduceStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) {
      throw Exception('Empty array');
    }

    List<double> positiveNumbers = array.where((elem) => elem > 0).toList();
    double? sumOfPositiveNumbers = positiveNumbers.isNotEmpty
        ? positiveNumbers.reduce((a, b) => a + b)
        : null;

    return array.asMap().entries.map((entry) {
      int i = entry.key;
      double value = entry.value;

      if (sumOfPositiveNumbers != null) {
        return i.isEven ? value * 2 : value - sumOfPositiveNumbers;
      } else {
        return i.isEven ? value * 2 : value;
      }
    }).toList();
  }
}

ActionStrategy getVariant(String actionNumber) {
  switch (actionNumber) {
    case '1':
      return PositiveAverageStrategy();
    case '2':
      return MultiplyByMinValueStrategy();
    case '3':
      return TripleDivisibleAverageStrategy();
    case '4':
      return DivisionByMaxHalfStrategy();
    case '5':
      return MultiplyByMinMaxStrategy();
    case '6':
      return MultiplyMaxDivMinStrategy();
    case '7':
      return SumOfThreeMinValuesStrategy();
    case '8':
      return EvenMultiplyOddReduceStrategy();
  }

  return getVariant(actionNumber);
}
