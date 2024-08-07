import 'dart:io';

class CompareFiles {
  Future<void> isEqual(
      {required String firstFilePath, required String secondFilePath}) async {
    final firstFile = File(firstFilePath);
    final secondFile = File(secondFilePath);

    if (!firstFile.existsSync()) {
      throw 'first file do not exist! Create it or enter right path';
    }

    if (!secondFile.existsSync()) {
      throw 'second file do not exist! Create it or enter right path';
    }

    final firstFileContent = await firstFile.readAsLines();
    final secondFileContent = await secondFile.readAsLines();

    for (var i = 0; i < firstFileContent.length; i++) {
      if ((firstFileContent[i] != secondFileContent[i]) ||
          secondFileContent[i].isEmpty) {
        exit;
        throw 'Files are not equal. Line number is ${i + 1}';
      } else {
        continue;
      }
    }
  }
}

void main(List<String> arguments) async {
  final comparingFiles = CompareFiles();

  try {
    await comparingFiles.isEqual(
        firstFilePath: arguments[0], secondFilePath: arguments[1]);
    print('Files are equals');
  } catch (e) {
    print(e.toString());
  }
}
