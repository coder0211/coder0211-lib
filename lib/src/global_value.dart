import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';

class GlobalValue {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defauldScreenWidth = 0.0;

  static void initValue(BuildContext context) {
    screenHeight = BaseUtils.getScreenHeight(context);
    screenWidth = BaseUtils.getScreenWidth(context);
    defauldScreenWidth = 390;
  }
}
