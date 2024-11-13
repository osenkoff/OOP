import 'dart:io';

import 'package:args/command_runner.dart';

import '../actions.dart';
import '../models/action_result.dart';

class ChooseActionCommand extends Command {
  @override
  final name = 'action';
  @override
  final description = 'Choose a number for the available actions';

  ChooseActionCommand() {
    argParser.addOption(
      'action',
      abbr: 'a',
      help: 'Specify the action to perform on the array.',
      allowedHelp: {
        '1': 'Add the average of the positive elements of the array to each element of the array.',
        '2': 'Multiply each element of the array by the minimum element of the original array.',
        '3': 'Multiply elements divisible by 3 by the average of elements divisible by 2.',
        '4': 'Divide each element of the array by half of the maximum element.',
        '5': 'Multiply each negative element by the product of the max and min elements.',
        '6': 'Multiply each element by the max element and divide by the min element.',
        '7': 'Add the sum of the three smallest elements to each element.',
        '8': 'Adjust elements at even positions by 2, and subtract non-negative sum from odd positions.',
      },
    );
  }

  @override
  void run() async {
    final actionNumber = argResults![name];
    final actionResult = await getActionResult(actionNumber);

    print(actionResult.message);
    if (actionResult.array != null) {
      print(actionResult.array);
    }
  }

  Future<ActionResult> getActionResult(String actionNumber) async {
    final actions = Actions();

    const avaliableActions = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
    ];

    if (avaliableActions.contains(actionNumber)) {
      final receivedArray = _getArrayFromConsole();

      return ActionResult(
        message: '# Output array after applying action $actionNumber',
        array: actions.selectAction(
          actionNumber: actionNumber,
          receivedArray: receivedArray,
        ),
      );
    } else {
      return ActionResult(
        message:
            'Entered action is not allowed! Please, enter: <action --help> to get more information',
      );
    }
  }

  List<double> _getArrayFromConsole() {
    List<double> numbers = [];

    print('Enter numbers separated by spaces to fill the array:');
    String? input = stdin.readLineSync();

    if (input != null) {
      List<String> parts = input.split(' ');

      for (var part in parts) {
        double? number = double.tryParse(part);
        if (number != null) numbers.add(number);
      }
    }

    return numbers;
  }

  @override
  void printUsage() {
    print('To run the program successfully enter: <path> action --action=<number>');
    print(argParser.usage);
  }
}
