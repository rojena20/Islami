import 'package:flutter/material.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/sura_details.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
    ),
  );
}