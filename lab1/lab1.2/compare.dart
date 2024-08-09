import 'dart:io';

class CompareFiles {
  static int _line = 0;

  Future<bool> isEqual({
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

    for (_line; _line < firstFileContent.length; _line++) {
      if (firstFileContent[_line].contains(secondFileContent[_line])) {
        continue;
      } else {
        return false;
      }
    }
    return true;
  }
  static int get line => _line;
}

void main(List<String> arguments) async {
  final comparingFiles = CompareFiles();
  final filesAreEqual = await comparingFiles.isEqual(
    firstFilePath: arguments[0],
    secondFilePath: arguments[1],
  );

  try {
    if (filesAreEqual) {
      print('Files are equal!');
    } else {
      final int mismatchLine = CompareFiles.line;
      throw 'Files are not equals! Line number is ${mismatchLine + 1}';
    }
  } catch (e) {
    print(e.toString());
  }
}
