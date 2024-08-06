import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static Color primaryColor = Color(0xffB7935F);
  static Color primaryDarkColor = Color(0xff141A2E);
  static Color secondaryColor = Color(0xff242424);
  static Color whiteColor = Colors.white;
  static Color secondaryDarkColor = Color(0xffF8F8F8);
  static Color whiteTransparentColor = Color.fromARGB(200, 255, 255, 255);
  static Color yellowColor = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inder(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.inder(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: secondaryColor,
      ),

    ),
    dividerColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: secondaryColor,
      showUnselectedLabels: false,
      selectedLabelStyle: GoogleFonts.inder(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    primaryColor: primaryColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: secondaryDarkColor,
      ),
      bodyLarge: GoogleFonts.inder(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.inder(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: yellowColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color: secondaryDarkColor,
      ),

    ),
    dividerColor: yellowColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      selectedItemColor: yellowColor,
      showUnselectedLabels: false,
      selectedLabelStyle: GoogleFonts.inder(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: yellowColor,
      ),
    ),
    primaryColor: primaryDarkColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: primaryDarkColor,
    ),
  );
}
