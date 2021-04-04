import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class _JsonFile extends ChangeNotifier {
  String _pathFile;

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    final pathFile = '${directory.path}/cards_user.json';

    _pathFile = pathFile;
  }

  Future<Map> readData() async {
    final resp = await rootBundle.loadString(_pathFile);
    Map responseDecode = jsonDecode(resp);

    return responseDecode;
  }

  
}

final jsonFile = new _JsonFile();
