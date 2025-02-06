class StringUtils {
  String trimBlanks(String str) {
    const emptyString = '';

    List<String> spaceSymbols = [' ', '\t', '\n', '\r'];
    String resultString = '';
    String spaceHolder = '';

    for (var i = 0; i < str.length; i++) {
      String symbol = str[i];

      if (spaceSymbols.contains(symbol)) {
        if (resultString.isNotEmpty) {
          spaceHolder += symbol;
        }
        continue;
      }

      if (spaceHolder.isNotEmpty) {
        resultString += spaceHolder;
        spaceHolder = emptyString;
      }

      resultString += symbol;
    }

    return resultString;
  }

  String removeExtraSpaces(String arg) {
    List<String> spaceSymbols = [' ', '\t', '\n', '\r'];
    Set<String> delimiters = {',', '.', '!', '?', ';', ':'};

    String resultString = '';
    bool isSpace = false;

    for (int i = 0; i < arg.length; i++) {
      final symbol = arg[i];

      if (!spaceSymbols.contains(symbol)) {
        if (isSpace &&
            resultString.isNotEmpty &&
            !delimiters.contains(symbol)) {
          resultString += ' ';
        }
        resultString += symbol;
        isSpace = false;
        continue;
      }

      isSpace = true;
    }
    return resultString;
  }

  String findAndReplace(String subject, String search, String replace) {
    String result = '';

    for (var i = 0; i < subject.length; i++) {
      final symbol = subject[i];

      if (i + search.length <= subject.length &&
          subject.substring(i, i + search.length) == search) {
        result += replace;
        i += search.length - 1;
      } else {
        result += symbol;
      }
    }

    return result;
  }
}
