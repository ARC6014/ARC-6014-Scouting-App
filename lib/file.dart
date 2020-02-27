import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:scouting_app/input.dart';

String fileContent;

Future get _localPath async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return applicationDirectory.path;
}

Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/data.txt");
}

Future<String> readFile() async {
    try {
        final file = await _localFile;
        fileContent = await file.readAsString();
        return fileContent;
    } catch (e) {
        print(e);
        return null;
    }
}

Future writeFile(String text) async {
    final file = await _localFile;
    await file.writeAsString("$text");
}


void writeInput(Input input) {
    readFile().then((value) {
        writeFile(value + '/              /\n' + input.toFileString());
    });
}