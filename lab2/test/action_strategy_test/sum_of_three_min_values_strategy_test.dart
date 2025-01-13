import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Has an array which includes only three elements', () {

    var sumOfThreeMinValuesStrategy = SumOfThreeMinValuesStrategy();
    
    test(
        'If array has three positive elements, return updated array '
        'that add the amount of three lowest elements', () {
      List<double> listWithPositiveElements = [10, 30, 2];
      List<double> expectedAnswer = [52, 72, 44];

      expect(
        sumOfThreeMinValuesStrategy.execute(listWithPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has three negative elements, return updated array '
        'that add the amount of three lowest elements', () {
      List<double> listWithNegativeElements = [-10, -30, -2];
      List<double> expectedAnswer = [-52, -72, -44];

      expect(
        sumOfThreeMinValuesStrategy.execute(listWithNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has three different elements, return updated array '
        'that add the amount of three lowest elements', () {
      List<double> listWithDifferentElements = [-10, 30, -2];
      List<double> expectedAnswer = [8, 48, 16];

      expect(
        sumOfThreeMinValuesStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });

    test('If array has three zeros, return original array', () {
      List<double> listWithZeros = [0, 0, 0];
      List<double> expectedAnswer = [0, 0, 0];

      expect(
        sumOfThreeMinValuesStrategy.execute(listWithZeros),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes different amount of elements', () {

    var sumOfThreeMinValuesStrategy = SumOfThreeMinValuesStrategy();

    test(
        'If array has different amount of elements, return updated array '
        'that add the amount of three lowest elements', () {
      List<double> listWithDifferentElements = [-2, 4, 5, 0, 8, -1];
      List<double> expectedAnswer = [-5, 1, 2, -3, 5, -4];

      expect(
        sumOfThreeMinValuesStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {

    var sumOfThreeMinValuesStrategy = SumOfThreeMinValuesStrategy();

    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => sumOfThreeMinValuesStrategy.execute(emptyList),
        throwsException,
      );
    });

    test('If array has less than 3 items, return exception', () {
      List<double> listWithTwoElements = [-2, 4];

      expect(
        () => sumOfThreeMinValuesStrategy.execute(listWithTwoElements),
        throwsException,
      );
    });
  });
}
