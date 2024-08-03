import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/hadeth_model.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "إسلامي",
            style: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Card(
          color: Color.fromARGB(200, 255, 255, 255),
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
                  style: GoogleFonts.inder(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: Color(0xffB7935F),
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
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
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
