import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 50.0,
        ),
        Image.asset("assets/images/radio_image.png"),
        SizedBox(
          height: 40.0,
        ),
        Text(
          "quran_radio".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              size: 35.0,
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
            ),
            SizedBox(
              width: 40.0,
            ),
            Icon(
              Icons.play_arrow_rounded,
              size: 50.0,
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
            ),
            SizedBox(
              width: 40.0,
            ),
            Icon(
              Icons.skip_next,
              size: 35.0,
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
            ),
          ],
        ),
      ],
    );
  }
}
