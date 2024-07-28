import 'dart:io';

class FileCopier {
  String? inputFilePath;
  String? outputFilePath;

  FileCopier(this.inputFilePath, this.outputFilePath);

  void copyToFile(File inputFile, File outputFile) async {
    final content = await inputFile.readAsString();
    await outputFile.writeAsString(content);
    stdout.write("Copied successfully");
  }

  void copy() async {
    File inputFile = File(inputFilePath!);
    File outputFile = File(outputFilePath!);

    if(!await inputFile.exists()) {
      stdout.write("Input file does not exist");
    } else if (!await outputFile.exists()) {
      stdout.write("Output file does not exist! Create? \nWrite y/n: ");
      if(stdin.readLineSync() == 'y') {
        await outputFile.create();
        copyToFile(inputFile, outputFile);
      } else {
        stdout.write("Output file does not exist");
      }
    } else {
      copyToFile(inputFile, outputFile);
    }
  }
}

/* To run this program write:
     dart compile exe copyfile.dart
   then
     copyfile.exe <input file name.txt> <output file name.txt>
*/

void main(List<String> args) {
  final inputFile = args[0];
  final outputFile = args[1];

  final fileCopier = FileCopier(inputFile, outputFile);
  fileCopier.copy();
}