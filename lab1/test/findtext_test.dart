import 'package:lab1/task3/findtext.dart';
import 'package:test/test.dart';

void main() {
  late FindText findText;

  setUp(() {
    findText = FindText();
  });

  group("Does the program return an exception", () {
    test("An empty file and an empty search string are resulted in the exception.",
        () {
      List<String> fileContent = [];
      String searchString = "";

      expect(
        () => findText.getMatchedStrings(
          fileContent: fileContent,
          searchString: searchString,
        ),
        throwsException,
      );
    });

    test(
        "An empty file and a non-empty search string are resulted in the exception.",
        () {
      // Arrange
      List<String> fileContent = [];
      String searchString = "example";

      expect(
        () => findText.getMatchedStrings(
          fileContent: fileContent,
          searchString: searchString,
        ),
        throwsException,
      );
    });

    test(
        "A non-empty file and an empty search string are resulted in the exception.",
        () {
      // Arrange
      List<String> fileContent = ["example"];
      String searchString = "";

      expect(
        () => findText.getMatchedStrings(
          fileContent: fileContent,
          searchString: searchString,
        ),
        throwsException,
      );
    });
  });

  group("Does the file contain the text", () {
    test("The search text is not contained in the file.", () {
      // Arrange
      List<String> fileContent = ["example test", "test", "example sample"];
      String searchString = "123";

      // Act
      final isTextContains = findText.getMatchedStrings(
        fileContent: fileContent,
        searchString: searchString,
      );

      expect(isTextContains, isEmpty);
    });

    test("The search text is contained in the file.", () {
      // Arrange
      List<String> fileContent = ["test sample", "sample test"];
      String searchString = "test";

      // Act
      final isTextNotContains = findText.getMatchedStrings(
        fileContent: fileContent,
        searchString: searchString,
      );

      expect(isTextNotContains, isNotEmpty);
    });
  });
}
