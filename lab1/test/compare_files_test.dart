import 'package:lab1/task2/compare.dart';
import 'package:test/test.dart';

void main() {
  late CompareFiles compareFiles;

  group('When strings are different', () {
    test('One empty and one filled strings are different', () {
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
      expect(isStringsNotEqual, false);
    });

    test('One filled and one empty strings are different', () {
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
      expect(isOppositeStringsNotEqual, false);
    });

    test('Two strings with unequal content are different', () {
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
      expect(isDifferentStringsNotEqual, false);
    });
  });

  group('When strings are same', () {
    test('Two empty strings should be same', () {
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
      expect(isStringsEqual, true);
    });
    test('Two strings with equal content should be same', () {
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
      expect(isSameStringsEqual, true);
    });
  });
}
