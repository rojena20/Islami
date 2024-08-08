import 'dart:math';

import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  double angle = 0.0;
  int index=1;

  rotateSebha() {
    counter++;
    angle += 12.3; // Rotate by 10.57 degrees (0.184 radians) per tap
    if (counter > 33) {
      counter = 0;
      angle = 0.0;
      if(index==4){
        index=1;
      }
      else{
        index++;
      }
    }
    notifyListeners();
  }
}
