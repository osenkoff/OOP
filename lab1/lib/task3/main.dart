import 'package:file/local.dart';

import 'findtext.dart';

void main(List<String> arguments) {
  final localFileSystem = LocalFileSystem();
  final findText = FindText();

  final filename = localFileSystem.file(arguments[0]);
  if (!filename.existsSync()) {
    print('File does not exist');
    return;
  }

  String searchString = arguments[1];

  var fileContent = filename.readAsLinesSync();

  final matchStrings = findText.getMatchedStrings(
    fileContent: fileContent,
    searchString: searchString,
  );

  try {
    if (matchStrings.isNotEmpty) {
      print(matchStrings);
    } else {
      print("Text not found");
    }
  } catch (e) {
    print(e.toString());
  }
}
