import 'dart:io';

class CompareFiles {
  int lineNumber = 0;

  Future<bool?> isEqual({
    required String firstFilePath,
    required String secondFilePath,
  }) async {
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

    for (lineNumber; lineNumber < firstFileContent.length; lineNumber++) {
      if (firstFileContent[lineNumber].contains(secondFileContent[lineNumber])) {
        continue;
      } else {
        return false;
      }
    }
    return null;
  }
}

void main(List<String> arguments) async {
  final comparingFiles = CompareFiles();
  final isEqualCheck = await comparingFiles.isEqual(
    firstFilePath: arguments[0],
    secondFilePath: arguments[1],
  );
  final int lineNumber = comparingFiles.lineNumber;

  try {
    if (isEqualCheck ?? true) {
      print('Files are equal!');
    } else {
      throw 'Files are not equals! Line number is ${lineNumber + 1}';
    }
  } catch (e) {
    print(e.toString());
  }
}
