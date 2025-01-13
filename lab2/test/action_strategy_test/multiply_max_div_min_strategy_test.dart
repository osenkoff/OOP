import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Has an array which includes one element', () {

    var multiplyMaxDivMinStrategy = MultiplyMaxDivMinStrategy();

    test(
        'If array has one positive element, return updated array '
        'that multiplied by max and divided by min elements', () {
      List<double> listWithPositiveElement = [5];
      List<double> expectedAnswer = [5];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithPositiveElement),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element, return updated array '
        'that multiplied by max and divided by min elements', () {
      List<double> listWithNegativeElement = [-5];
      List<double> expectedAnswer = [-5];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithNegativeElement),
        expectedAnswer,
      );
    });

    test('If array has only zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes more than one item', () {

    var multiplyMaxDivMinStrategy = MultiplyMaxDivMinStrategy();

    test(
        'If array has two positive elements, return updated array '
        'that multiplied by max and divided by min elements', () {
      List<double> listWithPositiveElements = [2, 4];
      List<double> expectedAnswer = [4, 8];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has two negative elements, return updated array '
        'that multiplied by max and divided by min elements', () {
      List<double> listWithNegativeElements = [-2, -4];
      List<double> expectedAnswer = [-1, -2];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has different elements, return updated array '
        'that multiplied by max and divided by min elements', () {
      List<double> listWithDifferentElements = [-5, 0, 3, -2, 7];
      List<double> expectedAnswer = [7, 0, -4.2, 2.8, -9.8];

      expect(
        multiplyMaxDivMinStrategy.execute(listWithDifferentElements),
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
