import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Given array that includes one element', () {
    test(
        'If array has one positive element, '
        'return updated array, multiplied by exist value', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithPositiveNumber = [5];
      List<double> expectedAnswer = [25];

      expect(
        multiplyByMinValueStrategy.execute(listWithPositiveNumber),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element, '
        'return updated array, multiplied by exist value', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithNegativeNumber = [-5];
      List<double> expectedAnswer = [25];

      expect(
        multiplyByMinValueStrategy.execute(listWithNegativeNumber),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        multiplyByMinValueStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Given array that includes more than one element', () {
    test(
        'If array has two positive elements, '
        'return updated array, multiplied by lowest value', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithTwoPositiveElements = [3, 1.5];
      List<double> expectedAnswer = [4.5, 2.25];

      expect(
        multiplyByMinValueStrategy.execute(listWithTwoPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two negative elements, '
        'return updated array, multiplied by lowest value', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithTwoNegativeElements = [-3, -1.5];
      List<double> expectedAnswer = [9, 4.5];

      expect(
        multiplyByMinValueStrategy.execute(listWithTwoNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two different elements, '
        'return updated array, multiplied by lowest value', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

      List<double> listWithDifferentElements = [4.5, -4.5];
      List<double> expectedAnswer = [-20.25, 20.25];

      expect(
        multiplyByMinValueStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Negative tests', () {
    test('If array is empty, return exception', () {
      var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();
      List<double> emptyList = [];

      expect(
        () => multiplyByMinValueStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
