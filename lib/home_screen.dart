import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/tabs/ahadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/settings_tab.dart';
import 'package:islami/tabs/tasbeeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/default_bg.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "islami".tr(),
          ),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: "radio".tr(),
              icon: ImageIcon(
                AssetImage("assets/images/icon_radio.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "tasbeeh".tr(),
              icon: ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "ahadeth".tr(),
              icon: ImageIcon(
                AssetImage("assets/images/icon_hadeth.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "quran".tr(),
              icon: ImageIcon(
                AssetImage("assets/images/icon_quran.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "settings".tr(),
              icon: Icon(Icons.settings),
              backgroundColor: MyThemeData.primaryColor,
            ),
          ],
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
