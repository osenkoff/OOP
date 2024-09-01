import 'package:lab1/task1/copyfile.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  late FileCopier fileCopier;

  final memoryFileSystem = MemoryFileSystem();

  setUp(() {
    fileCopier = FileCopier();
  });

  test('If input file is empty, output file should be empty', () {
    //  Arrange
    var inputFile = memoryFileSystem.file('inputFile.txt');
    var outputFile = memoryFileSystem.file('outputFile.txt');

    // Act
    inputFile.createSync(recursive: true);
    outputFile.createSync(recursive: true);

    fileCopier.copyToOutput(
      inputFile: inputFile,
      outputFile: outputFile,
    );

    var isOutputEmpty = outputFile.readAsStringSync().isEmpty;

    // Assert
    expect(isOutputEmpty, true);
  });

  test('If input file is not empty, output file should be same', () {
    //  Arrange
    var inputFile = memoryFileSystem.file('inputFile.txt');
    var outputFile = memoryFileSystem.file('outputFile.txt');

    // Act
    inputFile.createSync(recursive: true);
    outputFile.createSync(recursive: true);

    inputFile.writeAsString('test message');

    fileCopier.copyToOutput(
      inputFile: inputFile,
      outputFile: outputFile,
    );

    var areFilesSimilar =
        (inputFile.readAsStringSync() == outputFile.readAsStringSync());

    // Assert
    expect(areFilesSimilar, true);
  });

  test(
      'If input file contain special symbols, output file should be copied fully',
      () {
    //  Arrange
    var inputFile = memoryFileSystem.file('inputFile.txt');
    var outputFile = memoryFileSystem.file('outputFile.txt');

    inputFile.createSync(recursive: true);
    outputFile.createSync(recursive: true);

    // Act
    final specialSymbols =
        RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' "'" ']');

    inputFile.writeAsString('Special characters: @ – %. How do you SAY them?');

    fileCopier.copyToOutput(
      inputFile: inputFile,
      outputFile: outputFile,
    );

    var areSpecialSymbolsContains =
        outputFile.readAsStringSync().contains(specialSymbols);

    // Assert
    expect(areSpecialSymbolsContains, true);
  });
}
