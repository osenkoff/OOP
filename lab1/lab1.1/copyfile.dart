import 'dart:io';

class FileCopier {
  void copyToOutput(
      {required String inputFilePath, required String outputFilePath}) async {
    final inputFile = File(inputFilePath);
    final outputFile = File(outputFilePath);

    if (!await inputFile.existsSync()) {
      throw Exception(
        'File is not exist. Need to set the correct file path',
      );
    }

    final content = await inputFile.readAsString();

    if (!await outputFile.existsSync()) {
      outputFile.create();
      await outputFile.writeAsString(content);
    } else {
      await outputFile.writeAsString(content);
    }

    stdout.write('Successed');
  }
}

void main(List<String> arguments) async {
  final fileCopier = FileCopier();

  try {
    fileCopier.copyToOutput(
        inputFilePath: arguments[0], outputFilePath: arguments[1]);
  } on Exception catch (e) {
    stdout.writeln('Error: ${e.toString()}');
  }
}
