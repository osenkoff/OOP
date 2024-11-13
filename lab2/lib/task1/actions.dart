import 'package:collection/collection.dart';

import './strategy/mathematical_strategy/mathematical_strategy.dart';
import './strategy/mathematical_strategy/select_operation.dart';

class Actions {
  List<double> selectAction({
    required String actionNumber,
    required List<double> receivedArray,
  }) {
    SelectOperation operation = SelectOperation();

    List<double> updatedArray = [];

    if (receivedArray.isNotEmpty) {
      switch (actionNumber) {
        case '1':
          operation.setOperation(GetAverageValueStrategy());

          List<double> positiveNumbers =
              receivedArray.where((elem) => elem > 0).toList();
          double averageNumber = operation.execute(positiveNumbers);

          updatedArray =
              receivedArray.map((elem) => elem + averageNumber).toList();
        case '2':
          operation.setOperation(GetMinimalValueStrategy());

          double minimalNumber = operation.execute(receivedArray);

          updatedArray =
              receivedArray.map((elem) => elem * minimalNumber).toList();
        case '3':
          operation.setOperation(GetAverageValueStrategy());

          List<double> evenNumbers =
              receivedArray.where((elem) => elem % 2 == 0).toList();
          double averageNumber;

          evenNumbers.isNotEmpty
              ? averageNumber = operation.execute(evenNumbers)
              : averageNumber = 0;

          updatedArray = receivedArray
              .map((elem) => (elem % 3 == 0) ? elem * averageNumber : elem)
              .toList();
        case '4':
          operation.setOperation(GetMaximalValueStrategy());

          double halfOfMaximalNumber = (operation.execute(receivedArray)) / 2;

          updatedArray =
              receivedArray.map((elem) => elem / halfOfMaximalNumber).toList();
        case '5':
          operation.setOperation(GetMinimalValueStrategy());
          double minimalValue = operation.execute(receivedArray);

          operation.setOperation(GetMaximalValueStrategy());
          double maximalValue = operation.execute(receivedArray);

          double minMaxMultiple = minimalValue * maximalValue;

          updatedArray = receivedArray
              .map((elem) => (elem < 0) ? elem * minMaxMultiple : elem)
              .toList();
        case '6':
          operation.setOperation(GetMinimalValueStrategy());
          double minimalValue = operation.execute(receivedArray);

          operation.setOperation(GetMaximalValueStrategy());
          double maximalValue = operation.execute(receivedArray);

          updatedArray = receivedArray
              .map((elem) => elem * maximalValue / minimalValue)
              .toList();
        case '7':
          operation.setOperation(GetSumValueStrategy());

          List<double> sortedArray =
              receivedArray.sorted((a, b) => a.compareTo(b));
          List<double> threeLowestNumbers = sortedArray.take(3).toList();
          double sumOfThreeLowestNumbers =
              operation.execute(threeLowestNumbers);

          updatedArray = receivedArray
              .map((elem) => elem + sumOfThreeLowestNumbers)
              .toList();
        case '8':
          operation.setOperation(GetSumValueStrategy());

          List<double> positiveNumbers =
              receivedArray.where((elem) => elem > 0).toList();
          double sumOfPositiveNumbers = operation.execute(positiveNumbers);

          operation.setOperation(GetLengthStrategy());
          double arrayLength = operation.execute(receivedArray);

          for (int i = 0; i < arrayLength; i++) {
            final finalResult = (i % 2 == 0)
                ? receivedArray[i] * 2
                : receivedArray[i] - sumOfPositiveNumbers;

            updatedArray.add(finalResult);
          }
      }
    }

    return updatedArray;
  }
}
