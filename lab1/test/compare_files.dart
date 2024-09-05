import 'package:lab1/task2/compare.dart';
import 'package:test/test.dart';

void main() {
  late CompareFiles compareFiles;

  group('When strings are different', () {
    test('One empty and one filled strings should return false', () async {
      // Arrange
      compareFiles = CompareFiles();

      var firstFileContent = [''];
      var secondFileContent = ['filled string'];

      // Act
      var isStringsNotEqual = compareFiles.isEqual(
        firstFileContent: firstFileContent,
        secondFileContent: secondFileContent,
      );

      // Assert
      expect(await isStringsNotEqual, false);
    });

    test('One filled and one empty strings should return false', () async {
      // Arrange
      compareFiles = CompareFiles();

      var firstFileContent = ['filled string'];
      var secondFileContent = [''];

      // Act
      var isOppositeStringsNotEqual = compareFiles.isEqual(
        firstFileContent: firstFileContent,
        secondFileContent: secondFileContent,
      );

      // Assert
      expect(await isOppositeStringsNotEqual, false);
    });

    test('Two strings with different content should return false', () async {
      // Arrange
      compareFiles = CompareFiles();

      var firstFileContent = ['First string content'];
      var secondFileContent = ['Second string content'];

      // Act
      var isDifferentStringsNotEqual = compareFiles.isEqual(
        firstFileContent: firstFileContent,
        secondFileContent: secondFileContent,
      );

      // Assert
      expect(await isDifferentStringsNotEqual, false);
    });
  });

  group('When strings are same', () {
    test('Two empty strings should return true', () async {
      // Arrange
      compareFiles = CompareFiles();

      var firstFileContent = [''];
      var secondFileContent = [''];

      // Act
      var isStringsEqual = compareFiles.isEqual(
        firstFileContent: firstFileContent,
        secondFileContent: secondFileContent,
      );

      // Assert
      expect(await isStringsEqual, true);
    });
    test('Two strings with same content should return true', () async {
      // Arrange
      compareFiles = CompareFiles();

      var firstFileContent = ['string content'];
      var secondFileContent = ['string content'];

      // Act
      var isSameStringsEqual = compareFiles.isEqual(
        firstFileContent: firstFileContent,
        secondFileContent: secondFileContent,
      );

      // Assert
      expect(await isSameStringsEqual, true);
    });
  });
}
