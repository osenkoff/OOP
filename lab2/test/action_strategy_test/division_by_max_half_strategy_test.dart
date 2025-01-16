import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

  group('Has an array which includes one element', () {
    test(
        'If array has one positive element, '
        'return updated array that divided by half of max element', () {
      List<double> listWithPositiveNumber = [6];
      List<double> expectedAnswer = [2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithPositiveNumber),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element, '
        'return updated array that divided by half of max element', () {
      List<double> listWithNegativeNumber = [-4];
      List<double> expectedAnswer = [2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithNegativeNumber),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(divisionByMaxHalfStrategy.execute(listWithZero), expectedAnswer);
    });
  });

  group('Has an array which includes more than one element', () {
    test(
        'If array has two positive elements, '
        'return updated array, that divided by half of max element', () {
      List<double> listWithTwoPositiveElements = [4, 64];
      List<double> expectedAnswer = [0.125, 2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithTwoPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two negative elements, '
        'return updated array, that divided by half of max element', () {
      List<double> listWithTwoNegativeElements = [-4, -64];
      List<double> expectedAnswer = [2, 32];

      expect(
        divisionByMaxHalfStrategy.execute(listWithTwoNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two different elements, '
        'return updated array, that divided by half of max element', () {
      List<double> listWithTwoDifferentElements = [-4, 32];
      List<double> expectedAnswer = [-0.25, 2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithTwoDifferentElements),
        expectedAnswer,
      );
    });

    test(
        'If array has plenty of different numbers, '
        'return updated array, that divided by half of max element and '
        'truncated by 3 decimal elements', () {
      List<double> listWithDifferentElements = [2, -8, 0, -16, 64, -64];
      List<double> expectedAnswer = [0.062, -0.25, 0, -0.5, 2, -2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {
    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => divisionByMaxHalfStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
