import 'package:lab1/task1/copyfile.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  late FileCopier fileCopier;

  final memoryFileSystem = MemoryFileSystem();

  setUp(() {
    fileCopier = FileCopier();
  });

  test('An empty input file is copied completely', () {
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

  test('A filled input file is copied completely', () {
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
      'The input file with special symbols is copied completely',
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
