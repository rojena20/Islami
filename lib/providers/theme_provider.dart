import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  ThemeProvider() {
    loadTheme();
  }

  channgeTheme(ThemeMode themeMode) async{
    mode = themeMode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode.toString());
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString('themeMode');
    if (themeString != null) {
      mode = themeString == ThemeMode.dark.toString() ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}
