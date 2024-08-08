import 'package:flutter/material.dart';

class TapsProvider extends ChangeNotifier {
  int selectedIndex = 0;

  selectTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
