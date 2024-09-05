import 'package:file/local.dart';
import 'package:lab1/task2/compare.dart';

void main(List<String> arguments) async {
  final localFileSystem = LocalFileSystem();
  final comparingFiles = CompareFiles();

  final firstFile = localFileSystem.file(arguments[0]);
  final secondFile = localFileSystem.file(arguments[1]);

  var firstFileContent = await firstFile.readAsLines();
  var secondFileContent = await secondFile.readAsLines();

  final filesAreEqual = await comparingFiles.isEqual(
    firstFileContent: firstFileContent,
    secondFileContent: secondFileContent,
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