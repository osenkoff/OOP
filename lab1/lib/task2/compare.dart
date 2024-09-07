class CompareFiles {
  static int _line = 0;

  bool isEqual({
    required List<String> firstFileContent,
    required List<String> secondFileContent,
  }) {
    for (_line; _line < firstFileContent.length; _line++) {
      if (firstFileContent[_line] == secondFileContent[_line]) {
        continue;
      } else {
        return false;
      }
    }
    return true;
  }

  static int get line => _line;
}
