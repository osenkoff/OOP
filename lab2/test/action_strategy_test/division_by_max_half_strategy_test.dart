import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Given array than includes one element', () {
    test(
        'If array has one positive element, '
        'return updated array that divided by half of max element', () {
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

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
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

      List<double> listWithNegativeNumber = [-4];
      List<double> expectedAnswer = [2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithNegativeNumber),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(divisionByMaxHalfStrategy.execute(listWithZero), expectedAnswer);
    });
  });

  group('Given array that includes more than one element', () {
    test(
        'If array has two positive elements, '
        'return updated array, that divided by half of max element', () {
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

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
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

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
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

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
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();

      List<double> listWithDifferentElements = [2, -8, 0, -16, 64, -64];
      List<double> expectedAnswer = [0.062, -0.25, 0, -0.5, 2, -2];

      expect(
        divisionByMaxHalfStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Negative tests', () {
    test('If array is empty, return exception', () {
      var divisionByMaxHalfStrategy = DivisionByMaxHalfStrategy();
      List<double> emptyList = [];

      expect(
        () => divisionByMaxHalfStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
