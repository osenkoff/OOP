import 'dart:async';
import 'dart:io';

class FileCopier {
  Future<bool> copyToOutput({
    required String inputFilePath,
    required String outputFilePath,
  }) async {
    final inputFile = File(inputFilePath);
    final outputFile = File(outputFilePath);

    isInputFileExist(inputFile: inputFile);

    final content = await inputFile.readAsString();

    if (!outputFile.existsSync()) {
      outputFile.create();
    }

    await outputFile.writeAsString(content);
    return true;
  }

  Future<bool> isInputFileExist({required File inputFile}) async {
    if (!await inputFile.exists()) {
      throw Exception('File is not exist. Need to set the correct file path');
    } else {
      return true;
    }
  }
}

void main(List<String> arguments) async {
  final fileCopier = FileCopier();

  try {
    await fileCopier.copyToOutput(
      inputFilePath: arguments[0],
      outputFilePath: arguments[1],
    );
    print('You successfully copied file');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
