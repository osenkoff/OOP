import 'package:file/local.dart';
import 'findtext.dart';

void main(List<String> arguments) async {
  final localFileSystem = LocalFileSystem();
  final findText = FindText();

  final filename = localFileSystem.file(arguments[0]);
  String searchString = arguments[1];

  var fileContent = await filename.readAsLines();

  final matchStrings = findText.getMatchedStrings(
    fileContent: fileContent,
    searchString: searchString,
  );

  var lines = FindText.matchingStrings;

  try {
    if (matchStrings == 1) {
      lines.forEach((value) => print(value));
    } else {
      print("Text not found");
    }
  } catch (e) {
    print(e.toString());
  }
}
