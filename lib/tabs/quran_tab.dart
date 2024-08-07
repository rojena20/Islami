import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/models/sura_informations_model.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';
import '../models/sura_model.dart';
import '../providers/theme_provider.dart';
import '../sura_details.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  SuraInformationsModel suraInformationsModel = SuraInformationsModel();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Image.asset(
          "assets/images/qur2an_screen_logo.png",
          height: 227,
          width: double.infinity,
        ),
        Table(
          border: TableBorder(
            top: BorderSide(
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
              width: 3.0,
            ),
            bottom: BorderSide(
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
              width: 3.0,
            ),
            verticalInside: BorderSide(
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
              width: 3.0,
            ),
          ),
          children: <TableRow>[
            TableRow(
              children: <TableCell>[
                TableCell(
                  child: Container(
                    height: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "sura_name".tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    height: 45.0,
                    alignment: Alignment.center,
                    child: Text(
                      "verses_number".tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: suraInformationsModel.suraNames.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SuraDetails.routeName,
                    arguments: SuraModel(
                      suraName: suraInformationsModel.suraNames[index],
                      englishSuraName: suraInformationsModel.englishSuraNames[index],
                      suraIndex: index,
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.locale == Locale("ar")
                            ? suraInformationsModel.suraNames[index]
                            : suraInformationsModel.englishSuraNames[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Container(
                      height: 45.0,
                      width: 3.0,
                      color: themeProvider.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.yellowColor,
                    ),
                    Expanded(
                      child: Text(
                        suraInformationsModel.versesNumber[index].toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
