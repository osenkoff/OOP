import 'dart:io';

import 'package:args/command_runner.dart';

import '../utils/string_utils.dart';

class ChooseFunctionCommand extends Command {
  @override
  final name = 'function';
  @override
  final description = 'Choose a function to execute.';

  ChooseFunctionCommand() {
    addSubcommand(FindAndReplaceCommand());
    addSubcommand(TrimBlanksCommand());
    addSubcommand(RemoveExtraSpacesCommand());
  }
}

class TrimBlanksCommand extends Command {
  @override
  final name = 'trim_blanks';
  @override
  final description = 'Trim leading and trailing blanks from a sentence.';

  @override
  void run() {
    final stringUtils = StringUtils();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isEmpty) {
      print('Invalid input.');
    }

    final result = stringUtils.trimBlanks(input);
    print('Result: $result');
  }
}

class RemoveExtraSpacesCommand extends Command {
  @override
  final name = 'remove_spaces';
  @override
  final description = 'Remove extra spaces from a sentence.';

  @override
  void run() {
    final stringUtils = StringUtils();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isEmpty) {
      print('Invalid input.');
      return;
    }

    final result = stringUtils.removeExtraSpaces(input);
    print('Result: $result');
  }
}

class FindAndReplaceCommand extends Command {
  @override
  final name = 'find_and_replace';
  @override
  final description = 'Find and replace text in a sentence.';

  @override
  void run() {
    final stringUtils = StringUtils();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;
    print('Enter the word to search for:');
    String search = stdin.readLineSync()!;
    print('Enter the word to replace with:');
    String replace = stdin.readLineSync()!;

    if (input.isEmpty || search.isEmpty || replace.isEmpty) {
      print('Invalid input.');
      return;
    }

    final result = stringUtils.findAndReplace(input, search, replace);
    print('Result: $result');
  }
}