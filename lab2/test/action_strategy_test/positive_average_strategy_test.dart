import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  var positiveAverageStrategy = PositiveAverageStrategy();

  group('Has an array which includes one element', () {
    test(
        'If array has one positive number, '
        'return updated array that added for every element average '
        'of positive elements', () {
      List<double> arrayWithPositiveNumber = [1.5];
      List<double> expectedAnswer = [3.0];

      expect(
        positiveAverageStrategy.execute(arrayWithPositiveNumber),
        expectedAnswer,
      );
    });

    test('If array has one negative number, return original array', () {
      List<double> arrayWithNegativeNumber = [-1.5];
      List<double> expectedAnswer = [-1.5];

      expect(
        positiveAverageStrategy.execute(arrayWithNegativeNumber),
        expectedAnswer,
      );
    });

    test('If array has one zero, return zero', () {
      List<double> arrayWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        positiveAverageStrategy.execute(arrayWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes more than one element', () {
    test(
        'If array has two positive numbers, '
        'return updated array that added '
        'for every element average of positive elements', () {
      List<double> arrayWithPositiveNumbers = [2, 4];
      List<double> expectedAnswer = [5, 7];

      expect(
        positiveAverageStrategy.execute(arrayWithPositiveNumbers),
        expectedAnswer,
      );
    });

    test('If array has two negative numbers, return original array', () {
      List<double> arrayWithNegativeNumbers = [-1.5, -3];
      List<double> expectedAnswer = [-1.5, -3];

      expect(
        positiveAverageStrategy.execute(arrayWithNegativeNumbers),
        expectedAnswer,
      );
    });

    test(
        'If array has two different number, return updated array '
        'that added for every element average of positive elements', () {
      List<double> arrayWithDifferentNumbers = [-1.5, 3];
      List<double> expectedAnswer = [1.5, 6];

      expect(
        positiveAverageStrategy.execute(arrayWithDifferentNumbers),
        expectedAnswer,
      );
    });

    test('If array has plenty of negative numbers, return original array', () {
      List<double> arrayWithNegativeNumbers = [
        -1.5,
        -3,
        -7.91234,
        -123.1233312,
        -1,
      ];
      List<double> expectedAnswer = [
        -1.5,
        -3,
        -7.91234,
        -123.1233312,
        -1,
      ];

      expect(
        positiveAverageStrategy.execute(arrayWithNegativeNumbers),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {
    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => positiveAverageStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
