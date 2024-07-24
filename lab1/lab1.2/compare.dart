import 'dart:io';

class Comparing {
  File? file1;
  File? file2;
  List<String> firstFileList = [];
  List<String> secondFileList = [];
  bool? isEqual = true;

  void compareFiles() async {
    var firstFileLines = await file1?.readAsLines();
    var secondFileLines = await file2?.readAsLines();
    for(final line in firstFileLines!) {
      firstFileList.add(line);
    }
    for(final line in secondFileLines!) {
      secondFileList.add(line);
    }
    for(int i = 0; i < firstFileList.length && i < secondFileList.length; i++) {
      if((firstFileList[i] != secondFileList[i])) {
        isEqual = false;
        print("Files are different. Line number is ${i + 1}");
      }
    }
    if(isEqual ?? true) {
      print("Files are equals");
    }
  }
}

void main() {
  Comparing compare = Comparing();
  compare.file1 = File("file1.txt");
  compare.file2 = File("file2.txt");
  compare.compareFiles();
}