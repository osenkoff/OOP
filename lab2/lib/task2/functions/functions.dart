class Functions {
  String trimBlanks(String str) {
    const space = ' ';

    int startIndex = 0;
    int endIndex = str.length - 1;

    for (var i = 0; i < str.length; i++) {
      if (str[startIndex] == space) {
        startIndex++;
      } else if (str[endIndex] == space) {
        endIndex--;
      }
    }
    final sentenceCollector = str.substring(startIndex, endIndex + 1);

    return sentenceCollector;
  }

  String removeExtraSpaces(String arg) {
    const space = ' ';

    List<String> delimiters = ['.', '!', '?', ','];
    String sentenceCollector = '';
    bool isSpace = false;

    for (int i = 0; i < arg.length; i++) {
      final symbol = arg[i];

      if (symbol != space) {
        if (isSpace == true &&
            sentenceCollector.isNotEmpty &&
            !delimiters.contains(symbol)) {
          sentenceCollector += space + symbol;
        } else {
          sentenceCollector += symbol;
        }
        isSpace = false;
      } else {
        isSpace = true;
      }
    }
    return sentenceCollector;
  }

  String findAndReplace(String subject, String search, String replace) {
    String result = '';

    for (var i = 0; i < subject.length; i++) {
      final symbol = subject[i];

      if (subject.substring(i, i + search.length) == search) {
        result += replace;
        i += search.length - 1;
      } else {
        result += symbol;
      }
    }

    return result;
  }
}
