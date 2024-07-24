import 'dart:io';
class Files {
  File? file1;
  File? file2;

  void copying() {
    file2?.writeAsStringSync(file1!.readAsStringSync(), mode: FileMode.append);
    print("Success");
  }
}

void main() {
  Files files = Files();
  files.file1 = File("file1.txt");
  files.file2 = File("file2.txt");
  files.copying();
}