import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';
import 'package:islami/my_theme_data.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    List<String> content = model.hadethContent;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/default_bg.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
          ),
        ),
        body: Card(
          color: MyThemeData.whiteTransparentColor,
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
                  "${model.hadethTitle}",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  indent: 30.0,
                  endIndent: 40.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.hadethContent.length,
                    itemBuilder: (context, index) {
                      return Text(
                        content[index],
                        textDirection: TextDirection.rtl,
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
