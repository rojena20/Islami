import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/sura_details_provider.dart';
import 'package:islami/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'models/sura_model.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.suraIndex),
      child: Consumer<SuraDetailsProvider>(
        builder: (context, suraDetailsProvider, child) => Container(
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
            body: Card(
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.whiteTransparentColor
                  : MyThemeData.primaryDarkColor,
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
                          margin: EdgeInsetsDirectional.only(
                            end: 25.0,
                          ),
                          decoration: BoxDecoration(
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.secondaryColor
                                : MyThemeData.yellowColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.whiteColor
                                : MyThemeData.secondaryColor,
                          ),
                        ),
                        Text(
                          context.locale == Locale("ar")
                              ? "سورة ${model.suraName}"
                              : model.englishSuraName,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: themeProvider.mode == ThemeMode.light
                                        ? MyThemeData.secondaryColor
                                        : MyThemeData.yellowColor,
                                  ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 30.0,
                      endIndent: 40.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: suraDetailsProvider.verses.length,
                        itemBuilder: (context, index) {
                          return Text(
                            "${suraDetailsProvider.verses[index]}(${index + 1})",
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
        ),
      ),
    );
  }
}
