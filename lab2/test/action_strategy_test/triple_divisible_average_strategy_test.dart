import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  var tripleDivisibleAverageStrategy = TripleDivisibleAverageStrategy();

  group('Has an array which includes one element', () {
    test(
        'If array has one positive element '
        'that divided only by 2, return original array', () {
      List<double> listWithElementDividedByTwo = [4];
      List<double> expectedAnswer = [4];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementDividedByTwo),
        expectedAnswer,
      );
    });

    test(
        'If array has one positive element '
        'that divided only by 3, return original array', () {
      List<double> listWithElementDividedByThree = [9];
      List<double> expectedAnswer = [9];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementDividedByThree),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element '
        'that divided only by 2, return original array', () {
      List<double> listWithElementDividedByTwo = [-4];
      List<double> expectedAnswer = [-4];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementDividedByTwo),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element '
        'that divided only by 3, return original array', () {
      List<double> listWithElementDividedByThree = [-9];
      List<double> expectedAnswer = [-9];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementDividedByThree),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes more than one element', () {

    test(
        'If array has positive and negative elements '
        'that divided only by 3, return original array', () {
      List<double> listWithElementsDividedByThree = [3, -9, 15, 21, 9, -33];
      List<double> expectedAnswer = [3, -9, 15, 21, 9, -33];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementsDividedByThree),
        expectedAnswer,
      );
    });

    test(
        'If array has positive and negative elements '
        'that divided only by 2, return original array', () {
      List<double> listWithElementsDividedByThree = [2, 4, 8, -14, -2, -22];
      List<double> expectedAnswer = [2, 4, 8, -14, -2, -22];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithElementsDividedByThree),
        expectedAnswer,
      );
    });

    test(
        'If array has different elements, that divided by 3 and 2, '
        'return updated array, where all elements divided by 3 '
        'multiplies on average of all elements that divides by 2', () {
      List<double> listWithDifferentElements = [6, -4, 0, 9, -8, 15, 10];
      List<double> expectedAnswer = [4.8, -4, 0, 7.2, -8, 12, 10];

      expect(
        tripleDivisibleAverageStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Negative tests', () {
    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => tripleDivisibleAverageStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
