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
            "إسلامي",
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
              label: "الراديو",
              icon: ImageIcon(
                AssetImage("assets/images/icon_radio.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "التسبيح",
              icon: ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "الأحاديث",
              icon: ImageIcon(
                AssetImage("assets/images/icon_hadeth.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "القرآن",
              icon: ImageIcon(
                AssetImage("assets/images/icon_quran.png"),
              ),
              backgroundColor: MyThemeData.primaryColor,
            ),
            BottomNavigationBarItem(
              label: "الاعدادات",
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
