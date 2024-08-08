import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  loadSuraFile(int index) async {
    String suraFile =
        await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = suraFile.trim().split("\n");
    verses = suraLines;
    notifyListeners();
  }
}
