class FindText {
  List<int> getMatchedStrings({
    required List<String> fileContent,
    required String searchString,
  }) {
    List<int> matchingStrings = [];

    if (fileContent.isEmpty) {
      throw Exception("Empty content found in file");
    }

    if (searchString.isEmpty) {
      throw Exception("Empty search result: search string no found");
    }

    for (int line = 0; line < fileContent.length; line++) {
      String matchString = fileContent[line];

      final containsSearch = matchString.contains(searchString);
      if (containsSearch) {
        matchingStrings.add(line + 1);
      }
    }
    return matchingStrings;
  }
}
