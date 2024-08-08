import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/hadeth_model.dart';

class HadethDatailsProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  loadHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadethFile.split("#");

    for (int i = 0; i < ahadeth.length; i++) {
      String hadeth = ahadeth[i];
      List<String> hadethLines = hadeth.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      HadethModel hadethModel = HadethModel(
        hadethTitle: title,
        hadethContent: content,
        englishHadethTitle: "",
      );
      allAhadeth.add(hadethModel);
      notifyListeners();
    }
  }
}
