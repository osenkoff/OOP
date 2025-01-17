import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  var multiplyByMinValueStrategy = MultiplyByMinValueStrategy();

  group('Has an array which includes one element', () {
    test(
        'If array has one positive element, '
        'return updated array, multiplied by exist value', () {

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

      List<double> listWithNegativeNumber = [-5];
      List<double> expectedAnswer = [25];

      expect(
        multiplyByMinValueStrategy.execute(listWithNegativeNumber),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        multiplyByMinValueStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes more than one element', () {
    test(
        'If array has two positive elements, '
        'return updated array, multiplied by lowest value', () {

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

      List<double> listWithDifferentElements = [4.5, -4.5];
      List<double> expectedAnswer = [-20.25, 20.25];

      expect(
        multiplyByMinValueStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {
    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => multiplyByMinValueStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
