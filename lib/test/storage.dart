import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MyStorage {
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localPath;
    return File("$path/dreamwalker.txt");
  }

  Future<String> readContent() async {
    try {
      final file = await localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "null";
    }
  }

  Future<File> writeContent(String content) async {
    final file = await localFile;
    return file.writeAsString('$content');
  }
}
