import 'dart:io';

import 'package:args/command_runner.dart';

import '../functions/functions.dart';

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

class FindAndReplaceCommand extends Command {
  @override
  final name = 'find_and_replace';
  @override
  final description = 'Find and replace text in a sentence.';

  @override
  void run() {
    final functions = Functions();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;
    print('Enter the word to search for:');
    String search = stdin.readLineSync()!;
    print('Enter the word to replace with:');
    String replace = stdin.readLineSync()!;

    if (input.isNotEmpty && search.isNotEmpty && replace.isNotEmpty) {
      final result = functions.findAndReplace(input, search, replace);
      print('Result: $result');
    } else {
      print('Invalid input.');
    }
  }
}

class TrimBlanksCommand extends Command {
  @override
  final name = 'trim_blanks';
  @override
  final description = 'Trim leading and trailing blanks from a sentence.';

  @override
  void run() {
    final functions = Functions();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isNotEmpty) {
      final result = functions.trimBlanks(input);
      print('Result: $result');
    } else {
      print('Invalid input.');
    }
  }
}

class RemoveExtraSpacesCommand extends Command {
  @override
  final name = 'remove_spaces';
  @override
  final description = 'Remove extra spaces from a sentence.';

  @override
  void run() {
    final functions = Functions();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isNotEmpty) {
      final result = functions.removeExtraSpaces(input);
      print('Result: $result');
    } else {
      print('Invalid input.');
    }
  }

  @override
  void printUsage() {
    print('To run the program successfully enter: <path> function function_name');
    print(argParser.usage);
  }
}