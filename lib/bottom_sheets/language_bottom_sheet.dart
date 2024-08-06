import 'package:flutter/material.dart';

import '../my_theme_data.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "العربية",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold,color: MyThemeData.primaryColor),
              ),
              Icon(
                Icons.done,
                color: MyThemeData.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الإنجليزية",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.done,
                color: MyThemeData.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
