import 'dart:io';

import 'package:args/args.dart';

import 'models/action_result.dart';
import 'actions.dart';

void main(List<String> args) async {
  var parser = ArgParser()
    ..addOption(
      'action',
      abbr: 'a',
      help: 'Available actions',
      allowedHelp: {
        '1': 'Add the average of the positive elements of the array to each element of the array.',
        '2': 'Multiply each element of the array by the minimum element of the original array.',
        '3': 'Multiply elements divisible by 3 without a remainder by the average of elements divisible by 2 without a remainder.',
        '4': 'Divide each element of the array by half of the maximum element.',
        '5': 'Multiply each negative element of the array by the product of the maximum and minimum elements of the original array.',
        '6': 'Multiply each element of the array by the maximum element of the original array and divide by the minimum element of the original array.',
        '7': 'Add the sum of the three smallest elements of the array to each element.',
        '8': 'Multiply elements at even positions in the array by 2, and subtract the sum of all non-negative elements from elements at odd positions.',
      },
    )
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Print out usage instructions',
      negatable: false,
    );

  var result = parser.parse(args);

  if (result.wasParsed('action')) {
    try {
      final actionResult = await _run(result);

      stdout.writeln(actionResult.message);
      if (actionResult.array != null) {
        stdout.writeln(actionResult.array);
      }
    } on Exception catch (e) {
      stdout.writeln(e.toString());
      return;
    }
  } else if (result.wasParsed('help')) {
    print(parser.usage);
    exit(0);
  }
}

Future<ActionResult> _run(ArgResults arguments) async {
  final actions = Actions();
  final actionOption = arguments.option('action');

  const validActions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  if (validActions.contains(actionOption)) {
    final receivedArray = _fillArray();

    return ActionResult(
      message: '# output array after applying action $actionOption',
      array: actions.selectAction(
        actionNumber: actionOption!,
        receivedArray: receivedArray,
      ),
    );
  } else {
    return ActionResult(
      message: 'Error reading action, use --help or -h to get more information',
    );
  }
}

List<double> _fillArray() {
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
