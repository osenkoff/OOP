import 'package:collection/collection.dart';

import 'maths_utils.dart';

abstract class ActionStrategy {
  List<double> execute(List<double> array);
}

class FirstActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    List<double> positiveNumbers = array.where((elem) => elem > 0).toList();
    double averageNumber = MathsUtils.min(positiveNumbers);

    final result = array.map((elem) => elem + averageNumber).toList();
    return result;
  }
}

class SecondActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    double minimalNumber = MathsUtils.min(array);

    final result = array.map((elem) => elem * minimalNumber).toList();
    return result;
  }
}

class ThirdActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    List<double> evenNumbers = array.where((elem) => elem % 2 == 0).toList();

    double averageNumber = 0;
    if (evenNumbers.isNotEmpty) {
      averageNumber = MathsUtils.average(evenNumbers);
    }

    final result = array
        .map((elem) => (elem % 3 == 0) ? elem * averageNumber : elem)
        .toList();
    return result;
  }
}

class ForthActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    double halfOfMaximalNumber = (MathsUtils.max(array)) / 2;

    final result = array.map((elem) => elem / halfOfMaximalNumber).toList();
    return result;
  }
}

class FifthActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    double minimalValue = MathsUtils.min(array);
    double maximalValue = MathsUtils.max(array);

    double minMaxMultiple = minimalValue * maximalValue;

    final result =
        array.map((elem) => (elem < 0) ? elem * minMaxMultiple : elem).toList();
    return result;
  }
}

class SixthActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    double minimalValue = MathsUtils.min(array);
    double maximalValue = MathsUtils.max(array);

    final result =
        array.map((elem) => elem * maximalValue / minimalValue).toList();
    return result;
  }
}

class SeventhActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    if (array.isEmpty) return array;

    List<double> sortedArray = array.sorted((a, b) => a.compareTo(b));
    List<double> threeLowestNumbers = sortedArray.take(3).toList();
    double sumOfThreeLowestNumbers = MathsUtils.sum(threeLowestNumbers);

    final result = array.map((elem) => elem + sumOfThreeLowestNumbers).toList();
    return result;
  }
}

class EighthActionStrategy implements ActionStrategy {
  @override
  List<double> execute(List<double> array) {
    List<double> result = [];
    if (array.isEmpty) return array;

    List<double> positiveNumbers = array.where((elem) => elem > 0).toList();
    double sumOfPositiveNumbers = MathsUtils.sum(positiveNumbers);

    int arrayLength = array.length;

    for (int i = 0; i < arrayLength; i++) {
      final finalResult =
          (i % 2 == 0) ? array[i] * 2 : array[i] - sumOfPositiveNumbers;

      result.add(finalResult);
    }

    return result;
  }
}

ActionStrategy getVariant(String actionNumber) {
  switch (actionNumber) {
    case '1':
      return FirstActionStrategy();
    case '2':
      return SecondActionStrategy();
    case '3':
      return ThirdActionStrategy();
    case '4':
      return ForthActionStrategy();
    case '5':
      return FifthActionStrategy();
    case '6':
      return SixthActionStrategy();
    case '7':
      return SeventhActionStrategy();
    case '8':
      return EighthActionStrategy();
  }

  return getVariant(actionNumber);
}
