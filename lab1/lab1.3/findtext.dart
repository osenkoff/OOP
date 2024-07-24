import 'dart:io';

class Finder {
  File? file;
  String? substring;
  bool? isEmpty = false;
  List<int> answer = [];

  void findText() async {
    int lineNum = 1;
    var getText = await file?.readAsLines();
    for(final line in getText!) {
      if(line.indexOf("$substring") == -1) {
        isEmpty = true;
        lineNum++;
      } else {
        isEmpty = false;
        answer.add(lineNum);
        lineNum++;
      }
    }
    if(isEmpty == false) {
      print("Text not found");
    } else {
      print("Lines: ${answer.join(", ")}");
    }
  }
}

void main() {
  Finder finder = Finder();
  finder.file = File("EvgOnegin.txt");
  finder.substring = "Я к вам пишу";
  finder.findText();
}