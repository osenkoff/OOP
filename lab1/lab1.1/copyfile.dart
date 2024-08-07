import 'dart:async';
import 'dart:io';

class FileCopier {
  Future<void> copyTosecond(
      {required String firstFilePath, required String secondFilePath}) async {
    final firstFile = File(firstFilePath);
    final secondFile = File(secondFilePath);

    if (!firstFile.existsSync()) {
      throw 'File is not exist. Need to set the correct file path';
    }

    final content = await firstFile.readAsString();

    if (!secondFile.existsSync()) {
      secondFile.create();
    }

    await secondFile.writeAsString(content);
  }
}

void main(List<String> arguments) async {
  final fileCopier = FileCopier();

  try {
    await fileCopier.copyTosecond(
        firstFilePath: arguments[0], secondFilePath: arguments[1]);
    print('You successfully copied file');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
