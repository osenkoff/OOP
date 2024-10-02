class FindText {
  static final List<int> _matchingStrings = [];

  List<int> getMatchedStrings({
    required List<String> fileContent,
    required String searchString,
  }) {
    if (fileContent.isEmpty) {
      throw Exception("Empty file");
    }

    if (searchString.isEmpty) {
      throw Exception("Empty string");
    }

    for (int line = 0; line < fileContent.length; line++) {
      final containsSearch = areStringsMatched(
        matchString: fileContent[line],
        searchString: searchString,
      );
      if (containsSearch) {
        _matchingStrings.add(line + 1);
      }
    }
    return matchingStrings;
  }

  bool areStringsMatched({
    required String matchString,
    required String searchString,
  }) {
    return matchString.contains(searchString) ? true : false;
  }

  static get matchingStrings => _matchingStrings;
}
