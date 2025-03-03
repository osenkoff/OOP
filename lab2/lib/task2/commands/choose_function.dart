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
    addSubcommand(HtmlEncodeCommand());
    addSubcommand(HtmlDecodeCommand());
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

    if (input.isEmpty) throw Exception('Invalid input.');

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

    if (input.isEmpty) throw Exception('Invalid input.');

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
    if (input.isEmpty) throw Exception('Invalid input string');

    print('Enter the word to search for:');
    String search = stdin.readLineSync()!;
    if (search.isEmpty) throw Exception('Invalid word to search');

    print('Enter the word to replace with:');
    String replace = stdin.readLineSync()!;
    if (replace.isEmpty) throw Exception('Invalid word to replace');

    final result = stringUtils.findAndReplace(input, search, replace);
    print('Result: $result');
  }
}

class HtmlEncodeCommand extends Command {
  @override
  final name = 'html_encode';
  @override
  final description = 'Encoding all HTML symbols';

  @override
  void run() {
    final stringUtils = StringUtils();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isEmpty) throw Exception('Invalid input.');

    final result = stringUtils.htmlEncode(input);
    print('Result: $result');
  }
}

class HtmlDecodeCommand extends Command {
  @override
  final name = 'html_decode';
  @override
  final description = 'Decoding all HTML codes';

  @override
  void run() {
    final stringUtils = StringUtils();

    print('Enter your sentence:');
    String input = stdin.readLineSync()!;

    if (input.isEmpty) throw Exception('Invalid input.');

    final result = stringUtils.htmlDecode(input);
    print('Result: $result');
  }
}