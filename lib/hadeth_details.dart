import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    List<String> content = model.hadethContent;
    return Container(
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
                Text(
                  context.locale == Locale("ar")
                      ? model.hadethTitle
                      : model.englishHadethTitle,
                  style: themeProvider.mode == ThemeMode.light
                      ? Theme.of(context).textTheme.titleMedium
                      : Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: MyThemeData.yellowColor),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  indent: 30.0,
                  endIndent: 40.0,
                  color: themeProvider.mode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.hadethContent.length,
                    itemBuilder: (context, index) {
                      return Text(
                        content[index],
                        textAlign: TextAlign.end,
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
    ;
  }
}
