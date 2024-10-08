import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_theme_data.dart';
import '../providers/theme_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              context.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "arabic".tr(),
                  style: context.locale == Locale("ar")
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.primaryColor
                                : MyThemeData.yellowColor,
                          )
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.secondaryColor
                                : MyThemeData.secondaryDarkColor,
                          ),
                ),
                context.locale == Locale("ar")
                    ? Icon(
                        Icons.done,
                        color: themeProvider.mode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.yellowColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              context.setLocale(Locale("en"));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: context.locale == Locale("en")
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.primaryColor
                                : MyThemeData.yellowColor,
                          )
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.mode == ThemeMode.light
                                ? MyThemeData.secondaryColor
                                : MyThemeData.secondaryDarkColor,
                          ),
                ),
                context.locale == Locale("en")
                    ? Icon(
                        Icons.done,
                        color: themeProvider.mode == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.yellowColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
