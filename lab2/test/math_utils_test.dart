import 'package:test/test.dart';

import 'package:lab2/task1/strategy/maths_utils.dart';

void main() {
  group('Positive tests', () {
    test('If array is not empty, get minimal value of array', () {
      List<double> listOfDouble = [12, 3, 0.1, 123, 3, 12];

      var minValue = MathsUtils.min(listOfDouble);
      var expectedAnswer = 0.1;

      expect(minValue, expectedAnswer);
    });

    test('If array is not empty, get maximal value of array', () {
      List<double> listOfDouble = [1, 2, 123, 4, 5];

      var maxValue = MathsUtils.max(listOfDouble);
      var expectedAnswer = 123;

      expect(maxValue, expectedAnswer);
    });

    test('If array is not empty, get average value of array', () {
      List<double> listOfDouble = [1, 2, 3, 4, 5];

      var averageValue = MathsUtils.average(listOfDouble);
      var expectedAnswer = 3;

      expect(averageValue, expectedAnswer);
    });

    test('If array is not empty get sum of array', () {
      List<double> listOfDouble = [1, 2, 3, 4, 5];

      var sumValue = MathsUtils.sum(listOfDouble);
      var expectedAnswer = 15;

      expect(sumValue, expectedAnswer);
    });

    test(
        'If array is not empty, get array that contains truncated elements', () {
      List<double> listOfDouble = [0.0265, 0.0024, 0.1234];

      var truncatedValue = listOfDouble.map((elem) =>
          MathsUtils.truncateToDecimalPlaces(elem, 3)).toList();
      var expectedAnswer = [0.026, 0.002, 0.123];

      expect(truncatedValue, expectedAnswer);
    });
  });
}
