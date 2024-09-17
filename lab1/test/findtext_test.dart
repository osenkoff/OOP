import 'package:lab1/task3/findtext.dart';
import 'package:test/test.dart';

void main() {
  late FindText findText;

  setUp(() {
    findText = FindText();
  });

  group("Did program return exception result", () {
    test("Empty file and empty search string finished with exception", () {
      List<String> fileContent = [];
      String searchString = "";

      expect(
              () => findText.getMatchedStrings(
            fileContent: fileContent,
            searchString: searchString,
          ),
          throwsException);
    });

    test("Empty file and not empty search string finished with exception", () {
      // Arrange
      List<String> fileContent = [];
      String searchString = "example";

      expect(
              () => findText.getMatchedStrings(
            fileContent: fileContent,
            searchString: searchString,
          ),
          throwsException);
    });

    test("Not empty file and empty search string finished with exception", () {
      // Arrange
      List<String> fileContent = ["example"];
      String searchString = "";

      expect(
              () => findText.getMatchedStrings(
            fileContent: fileContent,
            searchString: searchString,
          ),
          throwsException);
    });
  });

  group("Did text contains in file", () {
    test("The search text did not contains in file", () {
      // Arrange
      List<String> fileContent = ["example test", "test", "example sample"];
      String searchString = "123";

      // Act
      final isTextContains = findText.getMatchedStrings(
        fileContent: fileContent,
        searchString: searchString,
      );

      expect(isTextContains, 0);
    });

    test("The search text contains in file", () {
      // Arrange
      List<String> fileContent = ["test sample"];
      String searchString = "test";

      // Act
      final isTextNotContains = findText.getMatchedStrings(
        fileContent: fileContent,
        searchString: searchString,
      );

      expect(isTextNotContains, 1);
    });
  });
}
