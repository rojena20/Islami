import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  ThemeBottomSheet({super.key});

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
              themeProvider.channgeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "light".tr(),
                  style: themeProvider.mode == ThemeMode.light
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.primaryColor)
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.secondaryDarkColor),
                ),
                themeProvider.mode == ThemeMode.light
                    ? Icon(
                        Icons.done,
                        color: MyThemeData.primaryColor,
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
              themeProvider.channgeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "dark".tr(),
                  style: themeProvider.mode == ThemeMode.dark
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyThemeData.yellowColor)
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                ),
                themeProvider.mode == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color: MyThemeData.yellowColor,
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
