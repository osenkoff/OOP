import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Has an array which includes one element', () {

    var multiplyByMinMaxStrategy = MultiplyByMinMaxStrategy();

    test('If array has one positive element, return original array', () {
      List<double> listWithPositiveElement = [5];
      List<double> expectedAnswer = [5];

      expect(
        multiplyByMinMaxStrategy.execute(listWithPositiveElement),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element, return updated array '
        'that all negative elements multiplied by min and max values', () {
      List<double> listWithNegativeElement = [-5];
      List<double> expectedAnswer = [-125];

      expect(
        multiplyByMinMaxStrategy.execute(listWithNegativeElement),
        expectedAnswer,
      );
    });

    test('If array has only zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        multiplyByMinMaxStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes more than one element', () {

    var multiplyByMinMaxStrategy = MultiplyByMinMaxStrategy();

    test('If array has two positive elements, return original array', () {
      List<double> listWithPositiveElements = [5, 25];
      List<double> expectedAnswer = [5, 25];

      expect(
        multiplyByMinMaxStrategy.execute(listWithPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two negative elements, return updated array '
        'that all negative elements multiplied by min and max elements', () {
      List<double> listWithNegativeElements = [-5, -25];
      List<double> expectedAnswer = [-625, -3125];

      expect(
        multiplyByMinMaxStrategy.execute(listWithNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has different elements, return updated array '
        'that all negative elements multiplied by min and max elements', () {
      List<double> listWithDifferentElements = [-2, 8, -8, 0, 4, 5];
      List<double> expectedAnswer = [128, 8, 512, 0, 4, 5];

      expect(
        multiplyByMinMaxStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {

    var multiplyByMinMaxStrategy = MultiplyByMinMaxStrategy();

    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => multiplyByMinMaxStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
