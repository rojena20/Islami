import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme_data.dart';

import 'models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(model.suraIndex);
    }
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
        body: Card(
          color: MyThemeData.whiteTransparentColor,
          margin: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 25.0,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 25.0,
                      ),
                      decoration: BoxDecoration(
                        color: MyThemeData.secondaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: MyThemeData.whiteColor,
                      ),
                    ),
                    Text(
                      "سورة ${model.suraName}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Divider(
                  indent: 30.0,
                  endIndent: 40.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${verses[index]}(${index+1})",
                        textAlign: TextAlign.center,
                        //textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyMedium,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async{
    String suraFile=await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
      List<String> suraLines = suraFile.trim().split("\n");
      verses = suraLines;
      setState(() {});
  }
}
