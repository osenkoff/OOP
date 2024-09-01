import 'dart:async';

import 'package:file/file.dart';

class FileCopier {
  Future<bool> copyToOutput({
    required File inputFile,
    required File outputFile,
  }) async {
    isInputFileExist(inputFile: inputFile);

    if (!outputFile.existsSync()) {
      outputFile.createSync(recursive: true);
    }

    await inputFile.copy(outputFile.path);
    return true;
  }

  Future<bool> isInputFileExist({required File inputFile}) async {
    if (!inputFile.existsSync()) {
      throw Exception('File is not exist. Need to set the correct file path');
    } else {
      return true;
    }
  }
}
