import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';

extension GetSizeScreenEX on double {
  double width(BuildContext context) =>
      BaseUtils.getScreenWidth(context) * this;
  double height(BuildContext context) =>
      BaseUtils.getScreenHeight(context) * this;
}
