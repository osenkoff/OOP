import 'dart:async';
import 'dart:io';

class FileCopier {
  Future<void> copyToOutput(
      {required String inputFilePath, required String outputFilePath}) async {
    final inputFile = File(inputFilePath);
    final outputFile = File(outputFilePath);

    if (!inputFile.existsSync()) {
      throw 'File is not exist. Need to set the correct file path';
    }

    final content = await inputFile.readAsString();

    if (!outputFile.existsSync()) {
      outputFile.create();
    }

    await outputFile.writeAsString(content);
  }
}

void main(List<String> arguments) async {
  final fileCopier = FileCopier();

  try {
    await fileCopier.copyToOutput(
        inputFilePath: arguments[0], outputFilePath: arguments[1]);
    print('You successfully copied file');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
