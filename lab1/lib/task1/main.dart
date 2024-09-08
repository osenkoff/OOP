import 'package:file/local.dart';
import 'package:lab1/task1/copyfile.dart';

void main(List<String> arguments) async {
  final fileCopier = FileCopier();
  final localFileSystem = LocalFileSystem();

  try {
    await fileCopier.copyToOutput(
      inputFile: localFileSystem.file(arguments[0]),
      outputFile: localFileSystem.file(arguments[1]),
    );
    print('You successfully copied file');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}