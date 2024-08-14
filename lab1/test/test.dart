import 'dart:io';

import 'package:lab1/task1/copyfile.dart';
import 'package:lab1/task2/compare.dart';
import 'package:test/test.dart';

void main() {
  group('Task 1', () {
    copyfileTests();
  });

  group('Task 2', () {
    compareTests();
  });
}

void copyfileTests() {
  late FileCopier fileCopier;

  var inputFiles = <String>[
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/file1.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/input.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/inputFile.txt',
  ];
  var outputFiles = <String>[
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/file2.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/output.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task1/txt/outputFile.txt',
  ];

  setUp(() {
    fileCopier = FileCopier();
  });

  test('When files are copied, should return true', () async {
    //  Arrange
    var inputFile = inputFiles[0];
    var outputFile = outputFiles[0];

    // Act
    final filesAreCopied = fileCopier.copyToOutput(
      inputFilePath: inputFile,
      outputFilePath: outputFile,
    );

    // Assert
    expect(await filesAreCopied, true);
  });

  test('When output file is not exist, should create it and return true',
      () async {
    // Arrange
    var inputFile = inputFiles[1];
    var outputFile = outputFiles[1];

    // Act
    final createOutputFile = fileCopier.copyToOutput(
      inputFilePath: inputFile,
      outputFilePath: outputFile,
    );

    // Assert
    expect(await createOutputFile, true);
  });

  test('When input file is not exist, should return exception', () {
    // Arrange
    final inputFile = File(inputFiles[2]);

    // Act
    final isInputExist = fileCopier.isInputFileExist(inputFile: inputFile);

    // Assert
    expect(isInputExist, throwsException);
  });
}

void compareTests() {
  late CompareFiles compareFiles;

  var firstFiles = <String>[
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file1.1.1.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file1.1.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file1.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/firstFile.txt',
  ];

  var secondFiles = <String>[
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file1.1.2.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file1.2.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/file2.txt',
    'C:/Users/osenk/Desktop/Dart_practice/OOP/lab1/lib/task2/txt/secondFile.txt',
  ];

  setUp(() {
    compareFiles = CompareFiles();
  });

  group('When files exist', () {
    test('When files exist, should return true', () async {
      // Arrange
      var firstFile = File(firstFiles[0]);
      var secondFile = File(secondFiles[0]);

      // Act
      final filesAreExist = await compareFiles.areFilesExist(
        firstFile: firstFile,
        secondFile: secondFile,
      );

      // Assert
      expect(filesAreExist, true);
    });

    test('When files exist and equal, should return true', () async {
      // Arrange
      var firstFile = firstFiles[2];
      var secondFile = secondFiles[2];

      // Act
      final filesAreEqual = await compareFiles.isEqual(
        firstFilePath: firstFile,
        secondFilePath: secondFile,
      );

      // Assert
      expect(filesAreEqual, true);
    });

    test('When files exist and not equal, should return false', () async {
      // Arrange
      var firstFile = firstFiles[1];
      var secondFile = secondFiles[1];

      // Act
      final filesAreEqual = await compareFiles.isEqual(
        firstFilePath: firstFile,
        secondFilePath: secondFile,
      );

      // Assert
      expect(filesAreEqual, false);
    });
  });

  group('When files are not exist', () {
    test('When first file not exist, should return exception', () {
      // Arrange
      var firstFile = File(firstFiles[3]);
      var secondFile = File(secondFiles[2]);

      // Act
      final inputIsExist = compareFiles.areFilesExist(
          firstFile: firstFile, secondFile: secondFile);

      // Assert
      expect(inputIsExist, throwsException);
    });

    test('When second file not exist, should return exception', () {
      // Arrange
      var firstFile = File(firstFiles[2]);
      var secondFile = File(secondFiles[3]);

      // Act
      final inputIsExist = compareFiles.areFilesExist(
          firstFile: firstFile, secondFile: secondFile);

      // Assert
      expect(inputIsExist, throwsException);
    });
  });
}
