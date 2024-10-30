import 'package:collection/collection.dart';

class Actions {
  List<double> selectAction({
    required String actionNumber,
    required List<double> receivedArray,
  }) {
    List<double> updatedArray = [];

    if (receivedArray.isNotEmpty) {
      switch (actionNumber) {
        case '1':
          final positiveNumbers = receivedArray.where((elem) => elem > 0);
          double averageNumber = positiveNumbers.average;

          updatedArray =
              receivedArray.map((elem) => elem + averageNumber).toList();
        case '2':
          double minimalNumber = receivedArray.min;

          updatedArray =
              receivedArray.map((elem) => elem * minimalNumber).toList();
        case '3':
          final evenNumbers = receivedArray.where((elem) => elem % 2 == 0);
          double averageNumber;

          evenNumbers.isNotEmpty
              ? averageNumber = evenNumbers.average
              : averageNumber = 0;

          updatedArray = receivedArray
              .map((elem) => (elem % 3 == 0) ? elem + averageNumber : elem)
              .toList();
        case '4':
          double halfOfMaximalNumber = (receivedArray.max) / 2;

          updatedArray =
              receivedArray.map((elem) => elem / halfOfMaximalNumber).toList();
        case '5':
          double minMaxMultiple = receivedArray.min * receivedArray.max;

          updatedArray = receivedArray
              .map((elem) => (elem < 0) ? elem * minMaxMultiple : elem)
              .toList();
        case '6':
          double minimalNumber = receivedArray.min;
          double maximalNumber = receivedArray.max;

          updatedArray = receivedArray
              .map((elem) => elem * maximalNumber / minimalNumber)
              .toList();
        case '7':
          List<double> sortedArray =
              receivedArray.sorted((a, b) => a.compareTo(b));
          double sumOfThreeLowestNumbers = sortedArray.take(3).toList().sum;

          updatedArray = receivedArray
              .map((elem) => elem + sumOfThreeLowestNumbers)
              .toList();
        case '8':
          final positiveNumbers = receivedArray.where((elem) => elem > 0);
          double sumOfPositiveNumbers = positiveNumbers.sum;

          for (int i = 0; i < receivedArray.length; i++) {
            (i % 2 == 0 || i == 0)
                ? updatedArray.add(receivedArray[i] - sumOfPositiveNumbers)
                : updatedArray.add(receivedArray[i] * 2);
          }
      }
    } else {
      throw Exception(
          'Your array is empty! Try again and fill them\nOr use --help or -h to get more information'
      );
    }

    updatedArray = updatedArray.sorted((a, b) => a.compareTo(b));
    return updatedArray;
  }
}
