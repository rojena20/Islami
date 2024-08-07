import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/taps_provider.dart';
import 'package:islami/providers/theme_provider.dart';
import 'package:islami/tabs/ahadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/settings_tab.dart';
import 'package:islami/tabs/tasbeeh_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => TapsProvider(),
      child: Consumer<TapsProvider>(
        builder: (context, tapsProvider, child) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: themeProvider.mode == ThemeMode.light
                    ? AssetImage("assets/images/default_bg.png")
                    : AssetImage("assets/images/dark_bg.png"),
                fit: BoxFit.fill),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "islami".tr(),
              ),
            ),
            body: tabs[tapsProvider.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tapsProvider.selectedIndex,
              onTap: (value) {
                tapsProvider.selectTap(value);
              },
              items: [
                BottomNavigationBarItem(
                  label: "radio".tr(),
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_radio.png"),
                  ),
                  backgroundColor: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryDarkColor,
                ),
                BottomNavigationBarItem(
                  label: "tasbeeh".tr(),
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_sebha.png"),
                  ),
                  backgroundColor: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryDarkColor,
                ),
                BottomNavigationBarItem(
                  label: "ahadeth".tr(),
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_hadeth.png"),
                  ),
                  backgroundColor: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryDarkColor,
                ),
                BottomNavigationBarItem(
                  label: "quran".tr(),
                  icon: ImageIcon(
                    AssetImage("assets/images/icon_quran.png"),
                  ),
                  backgroundColor: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryDarkColor,
                ),
                BottomNavigationBarItem(
                  label: "settings".tr(),
                  icon: Icon(Icons.settings),
                  backgroundColor: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.primaryDarkColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> tabs = [
    RadioTab(),
    TasbeehTab(),
    AhadethTab(),
    QuranTab(),
    SettingsTab(),
  ];
}
