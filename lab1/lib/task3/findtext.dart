class FindText {
  static int _line = 0;
  static final _matchingStrings = [];

  int getMatchedStrings({
    required List<String> fileContent,
    required String searchString,
  }) {
    if (fileContent.isEmpty) {
      throw Exception("Empty file");
    }

    if (searchString.isEmpty) {
      throw Exception("Empty string");
    }

    for (_line; _line < fileContent.length; _line++) {
      if (areStringsMatched(
        matchString: fileContent[_line],
        searchString: searchString,
      )) {
        _matchingStrings.add(_line + 1);
      } else {
        continue;
      }
    }
    if (_matchingStrings.isNotEmpty) {
      return 1;
    } else {
      return 0;
    }
  }

  bool areStringsMatched({
    required String matchString,
    required String searchString,
  }) {
    if (matchString.contains(searchString)) {
      return true;
    } else {
      return false;
    }
  }

  static int get line => _line;

  static get matchingStrings => _matchingStrings;
}
