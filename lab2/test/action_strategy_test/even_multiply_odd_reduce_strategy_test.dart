import 'package:test/test.dart';

import 'package:lab2/task1/strategy/action_strategy.dart';

void main() {
  group('Has an array which includes only one odd element', () {

    var evenMultiplyOddReduceStrategy = EvenMultiplyOddReduceStrategy();

    test(
        'If array has one positive element, '
        'return updated array that all even elements multiplied by 2', () {
      List<double> listWithPositiveElement = [2];
      List<double> expectedAnswer = [4];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithPositiveElement),
        expectedAnswer,
      );
    });

    test(
        'If array has one negative element, '
        'return updated array that all even elements multiplied by 2', () {
      List<double> listWithNegativeElement = [-2];
      List<double> expectedAnswer = [-4];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithNegativeElement),
        expectedAnswer,
      );
    });

    test('If array has zero, return zero', () {
      List<double> listWithZero = [0];
      List<double> expectedAnswer = [0];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithZero),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes one odd and one even elements', () {

    var evenMultiplyOddReduceStrategy = EvenMultiplyOddReduceStrategy();

    test(
        'If array has positives odd and even elements, '
        'return updated array that even elements are multiplied by 2, '
        'odd elements are subtracted by sum of positive elements', () {
      List<double> listWithPositiveElements = [2, 3];
      List<double> expectedAnswer = [4, -2];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithPositiveElements),
        expectedAnswer,
      );
    });

    test(
        'If array has negative odd and even elements, '
        'return updated array that even elements are multiplied by 2, '
        'odd elements are subtracted by sum of positive elements', () {
      List<double> listWithNegativeElements = [-2, -3];
      List<double> expectedAnswer = [-4, -3];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithNegativeElements),
        expectedAnswer,
      );
    });

    test(
        'If array has different odd and even elements, '
        'return updated array that even elements are multiplied by 2, '
        'odd elements are subtracted by sum of positive elements', () {
      List<double> listWithDifferentElements = [-2, 3];
      List<double> expectedAnswer = [-4, 0];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });

    test('If array has zeros, return zeros', () {
      List<double> listWithZeros = [0, 0];
      List<double> expectedAnswer = [0, 0];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithZeros),
        expectedAnswer,
      );
    });
  });

  group('Has an array which includes plenty of different elements', () {

    var evenMultiplyOddReduceStrategy = EvenMultiplyOddReduceStrategy();

    test(
        'If array has different elements, '
        'return updated array that even elements are multiplied by 2, '
        'odd elements are subtracted by sum of positive elements', () {
      List<double> listWithDifferentElements = [0, -2, -5, 5, 3, -3];
      List<double> expectedAnswer = [0, -10, -10, -3, 6, -11];

      expect(
        evenMultiplyOddReduceStrategy.execute(listWithDifferentElements),
        expectedAnswer,
      );
    });
  });

  group('Has an array with wrong data', () {

    var evenMultiplyOddReduceStrategy = EvenMultiplyOddReduceStrategy();

    test('If array is empty, return exception', () {
      List<double> emptyList = [];

      expect(
        () => evenMultiplyOddReduceStrategy.execute(emptyList),
        throwsException,
      );
    });
  });
}
