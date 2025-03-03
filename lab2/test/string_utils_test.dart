import 'package:lab2/task2/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('TrimBlanks tests', () {
    test('should return trimmed string', () {
      String stringWithSpaces = '   Hello, buddy!   ';
      String correctString = 'Hello, buddy!';

      final processedString = StringUtils().trimBlanks(stringWithSpaces);

      expect(processedString, correctString);
    });

    test('should return trimmed string and save extra spaces', () {
      String stringWithExtraSpaces = '   Hello   , buddy  !    ';
      String correctString = 'Hello   , buddy  !';

      final processedString = StringUtils().trimBlanks(stringWithExtraSpaces);

      expect(processedString, correctString);
    });

    test('should return trimmed string and save extra spaces using another space delimiters', () {
      String stringWithAnotherDelimiters = '\t\t\tHello \r ,\u00A0buddy  !\u202F\u202F';
      String correctString = 'Hello \r ,\u00A0buddy  !';

      final processedString = StringUtils().trimBlanks(stringWithAnotherDelimiters);

      expect(processedString, correctString);
    });

    test('should return an exception if string is empty', () {
      String emptyString = '';

      final processedString = StringUtils().trimBlanks(emptyString);

      expect(processedString, emptyString);
    });
  });
  
  group('RemoveExtraSpaces tests', () {
    String correctString = 'Hello, buddy!';

    test('should return trimmed string', () {
      String stringWithSpaces = '   Hello, buddy!   ';

      final processedString = StringUtils().removeExtraSpaces(stringWithSpaces);

      expect(processedString, correctString);
    });

    test('should return a string without extra spaces', () {
      String stringWithExtraSpaces = '   Hello   , buddy  !    ';

      final processedString = StringUtils().removeExtraSpaces(stringWithExtraSpaces);

      expect(processedString, correctString);
    });

    test('should return trimmed string and save extra spaces using another space delimiters', () {
      String stringWithAnotherDelimiters = '\t\t\tHello \r ,\u00A0buddy  !\u202F\u202F';

      final processedString = StringUtils().removeExtraSpaces(stringWithAnotherDelimiters);

      expect(processedString, correctString);
    });

    test('should return an exception if string is empty', () {
      String emptyString = '';

      final processedString = StringUtils().removeExtraSpaces(emptyString);

      expect(processedString, emptyString);
    });
  });

  group('FindAndReplace tests', () {
    test('should return updated string', () {
      String inputString = 'Hello, buddy,   Hello!';
      String searchWord = 'Hello';
      String replaceWord = 'Hi';

      String correctString = 'Hi, buddy,   Hi!';

      final processedString = StringUtils().findAndReplace(inputString, searchWord, replaceWord);

      expect(processedString, correctString);
    });

    test('should return updated including space special symbol', () {
      String inputString = 'Hello,\rbuddy,   Hello!';
      String searchWord = '\r';
      String replaceWord = ' ';

      String correctString = 'Hello, buddy,   Hello!';

      final processedString = StringUtils().findAndReplace(inputString, searchWord, replaceWord);

      expect(processedString, correctString);
    });

    test('should return an exception if search word is not found in input string', () {
      String inputString = 'Hello, buddy!';
      String searchWord = 'Hi';
      String replaceWord = 'Hey';

      expect(() => StringUtils().findAndReplace(inputString, searchWord, replaceWord), throwsA(isA<Exception>()));
    });
  });

  group('HtmlEncode tests', () {
    test('should return encoded HTML string', () {
      String inputString = '"Hello & welcome <buddy>!"';
      String correctString = '&quot;Hello &amp; welcome &lt;buddy&gt;!&quot;';

      final processedString = StringUtils().htmlEncode(inputString).toString();

      expect(processedString, correctString);
    });
  });

  group('HtmlDecode tests', () {
    test('should return decoded HTML string', () {
      String inputString = '&quot;Hello &amp; welcome &lt;buddy&gt;!&quot;';
      String correctString = '"Hello & welcome <buddy>!"';

      final processedString = StringUtils().htmlDecode(inputString).toString();

      expect(processedString, correctString);
    });

    test('should return an exception if html code is not found', () {
      String inputString = '&yen;Hello &amp; &euro;welcome &lt;buddy&gt;&yen;';

      expect(() => StringUtils().htmlDecode(inputString), throwsA(isA<Exception>()));
    });
  });
}