import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/hadeth_datails_provider.dart';
import 'package:provider/provider.dart';

import '../hadeth_details.dart';
import '../models/hadeth_model.dart';
import '../my_theme_data.dart';
import '../providers/theme_provider.dart';

class AhadethTab extends StatelessWidget {
  AhadethTab({super.key});

  List<String> englishAhadethTitle = [
    "First Hadeth",
    "Second Hadeth",
    "Third Hadeth",
    "Fourth Hadeth",
    "Fifth Hadeth",
    "Sixth Hadeth",
    "Seventh Hadeth",
    "Eighth Hadeth",
    "Ninth Hadeth",
    "Tenth Hadeth",
    "Hadeth Eleventh",
    "Hadeth Twelfth",
    "Hadeth Thirteenth",
    "Hadeth Fourteenth",
    "Hadeth Fifteenth",
    "Hadeth Sixteenth",
    "Hadeth Seventeenth",
    "Hadeth Eighteenth",
    "Hadeth Nineteenth",
    "Hadeth Twentieth",
    "Hadeth Twenty-first",
    "Hadeth Twenty-second",
    "Hadeth Twenty-third",
    "Hadeth Twenty-fourth",
    "Hadeth Twenty-fifth",
    "Hadeth Twenty-sixth",
    "Hadeth Twenty-seventh",
    "Hadeth Twenty-eighth",
    "Hadeth Twenty-ninth",
    "Hadeth Thirtieth",
    "Hadeth Thirty-first",
    "Hadeth Thirty-second",
    "Hadeth Thirty-third",
    "Hadeth Thirty-fourth",
    "Hadeth Thirty-fifth",
    "Hadeth Thirty-sixth",
    "Hadeth Thirty-seventh",
    "Hadeth Thirty-eighth",
    "Hadeth Thirty-ninth",
    "Hadeth Fortieth",
    "Hadeth Forty-first",
    "Hadeth Forty-second",
    "Hadeth Forty-third",
    "Hadeth Forty-fourth",
    "Hadeth Forty-fifth",
    "Hadeth Forty-sixth",
    "Hadeth Forty-seventh",
    "Hadeth Forty-eighth",
    "Hadeth Forty-ninth",
    "Hadeth Fiftieth",
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => HadethDatailsProvider()..loadHadethFile(),
      child: Consumer<HadethDatailsProvider>(
        builder: (context, hadethDetailsProvider, child) => Column(
          children: [
            Image.asset(
              "assets/images/hadeth_logo.png",
              height: 227,
              width: double.infinity,
            ),
            Divider(
              thickness: 3.0,
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
            ),
            Text(
              "ahadeth".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Divider(
              thickness: 3.0,
              color: themeProvider.mode == ThemeMode.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.yellowColor,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hadethDetailsProvider.allAhadeth.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetails.routeName,
                        arguments: HadethModel(
                          hadethTitle: hadethDetailsProvider
                              .allAhadeth[index].hadethTitle,
                          englishHadethTitle: englishAhadethTitle[index],
                          hadethContent: hadethDetailsProvider
                              .allAhadeth[index].hadethContent,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 7.0),
                      child: Text(
                        "${'hadeth_number'.tr()} ${index + 1}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
