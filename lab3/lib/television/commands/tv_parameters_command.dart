import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lab3/television/utils/tv_utils.dart';

class TvParametersCommand extends Command {
  @override
  final name = 'television';

  @override
  final description = 'Execute program that work with tv';

  @override
  void run() {
    final actionsList = getActionsFromConsole();
    final resultSequence = TvUtils().getTvResponse(actionsList).responses;

    for (var result in resultSequence) {
      print(result.status);
    }
  }

  List<String> getActionsFromConsole() {
    List<String> actions = [];

    while (true) {
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) break;
      actions.add(input);
    }

    return actions;
  }
}
