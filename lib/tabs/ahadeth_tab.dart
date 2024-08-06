import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hadeth_details.dart';
import '../models/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: 227,
          width: double.infinity,
        ),
        Divider(
          thickness: 3.0,
        ),
        Text(
          "الأحاديث",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          thickness: 3.0,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: allAhadeth.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadethDetails.routeName,
                    arguments: HadethModel(
                      hadethTitle: allAhadeth[index].hadethTitle,
                      hadethContent: allAhadeth[index].hadethContent,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 7.0),
                  child: Text(
                    "الحديث رقم ${index + 1}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  loadHadethFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadeth = hadethFile.split("#");
    for (int i = 0; i < ahadeth.length; i++) {
      String hadeth = ahadeth[i];
      List<String> hadethLines = hadeth.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      HadethModel hadethModel =
          HadethModel(hadethTitle: title, hadethContent: content);
      allAhadeth.add(hadethModel);
      setState(() {});
    }
  }
}
