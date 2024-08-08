import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/sebha_provider.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class TasbeehTab extends StatelessWidget {
  TasbeehTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      child: Consumer<SebhaProvider>(
        builder: (context, sebhaProvider, child) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(themeProvider.mode == ThemeMode.light
                              ? "assets/images/head_sebha_logo.png"
                              : "assets/images/head_sebha_dark.png"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          sebhaProvider.rotateSebha();
                          print("counter ${sebhaProvider.counter}");
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top:78.0),
                            child: AnimatedRotation(
                              turns: sebhaProvider.angle / (2 * 3.141592653589793),
                              duration: Duration(milliseconds: 30),
                              child: Image.asset(
                                  themeProvider.mode == ThemeMode.light
                                      ? "assets/images/body_sebha_logo.png"
                                      : "assets/images/body_sebha_dark.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0,),
                  Text(
                    "praises_number".tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 13.0,
                    ),
                    decoration: BoxDecoration(
                      color: themeProvider.mode == ThemeMode.light
                          ? Color(0xffC9B496)
                          : MyThemeData.primaryDarkColor,
                      borderRadius: BorderRadius.circular(19.0),
                    ),
                    child: Text(
                      sebhaProvider.counter.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: context.locale == Locale("en")
                        ? EdgeInsets.symmetric(
                            vertical: 7.0,
                            horizontal: 10.0,
                          )
                        : EdgeInsets.symmetric(
                            vertical: 3.0,
                            horizontal: 15.0,
                          ),
                    decoration: BoxDecoration(
                      color: themeProvider.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.yellowColor,
                      borderRadius: context.locale == Locale("en")
                          ? BorderRadius.circular(27.0)
                          : BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      "praise_${sebhaProvider.index}".tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeProvider.mode == ThemeMode.light
                              ? MyThemeData.whiteColor
                              : MyThemeData.secondaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
