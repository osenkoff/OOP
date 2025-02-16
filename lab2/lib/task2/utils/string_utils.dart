class StringUtils {
  String trimBlanks(String str) {
    const emptyString = '';

    List<String> spaceSymbols = [' ', '\t', '\r', '\u00A0', '\u202F'];
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
    List<String> spaceSymbols = [' ', '\t', '\r', '\u00A0', '\u202F'];
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

  StringBuffer htmlEncode(String text) {
    StringBuffer result = StringBuffer();

    Map<String, String> htmlSymbols = {
      '"': '&quot;',
      '\'': '&apos;',
      '<': '&lt;',
      '>': '&gt;',
      '&': '&amp;'
    };

    for (var i = 0; i < text.length; i++) {
      final symbol = text[i];

      if (htmlSymbols.containsKey(symbol)) {
        result.write(htmlSymbols[symbol]!);
        continue;
      }
      result.write(symbol);
    }

    return result;
  }

  StringBuffer htmlDecode(String html) {
    StringBuffer result = StringBuffer();
    StringBuffer tempString = StringBuffer();

    Map<String, String> htmlSymbols = {
      '&quot;': '"',
      '&apos;': '\'',
      '&lt;': '<',
      '&gt;': '>',
      '&amp;': '&'
    };

    bool isEntity = false;

    for (int i = 0; i < html.length; i++) {
      final symbol = html[i];

      if (symbol == '&') {
        isEntity = true;
      }

      if (isEntity) {
        if (symbol == ';' && isEntity) {
          tempString.write(symbol);
          String htmlCode = tempString.toString();

          if (htmlSymbols.containsKey(htmlCode)) {
            result.write(htmlSymbols[htmlCode]);
            tempString.clear();
            htmlCode = '';
          }

          isEntity = false;
          continue;
        }
        tempString.write(symbol);
        continue;
      }

      result.write(symbol);
    }

    return result;
  }
}
