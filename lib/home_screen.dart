import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "إسلامي",
            style: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "الراديو",
              icon: ImageIcon(
                AssetImage("assets/images/icon_radio.png"),
              ),
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              label: "التسبيح",
              icon: ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              label: "الأحاديث",
              icon: ImageIcon(
                AssetImage("assets/images/icon_hadeth.png"),
              ),
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              label: "القرآن",
              icon: ImageIcon(
                AssetImage("assets/images/icon_quran.png"),
              ),
              backgroundColor: Color(0xffB7935F),
            ),
            BottomNavigationBarItem(
              label: "الاعدادات",
              icon: Icon(Icons.settings),
              backgroundColor: Color(0xffB7935F),
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
