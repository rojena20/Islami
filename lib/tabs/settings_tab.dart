import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/bottom_sheets/language_bottom_sheet.dart';
import 'package:islami/bottom_sheets/theme_bottom_sheet.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "theme".tr(),
            style: themeProvider.mode == ThemeMode.light
                ? Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)
                : Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ThemeBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(
                themeProvider.mode == ThemeMode.light
                    ? "light".tr()
                    : "dark".tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: themeProvider.mode == ThemeMode.dark
                          ? MyThemeData.secondaryDarkColor
                          : MyThemeData.secondaryColor,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Text(
            "language".tr(),
            style: themeProvider.mode == ThemeMode.light
                ? Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)
                : Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => LanguageBottomSheet(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(
                context.locale == Locale("ar") ? "arabic".tr() : "english".tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: themeProvider.mode == ThemeMode.dark
                          ? MyThemeData.secondaryDarkColor
                          : MyThemeData.secondaryColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
