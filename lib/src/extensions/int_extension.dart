import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';

extension IntEX on int {
  /// # [w(context)] Get the size as a percentage of the screen width
  double w(BuildContext context) => BaseUtils.getScreenWidth(context) * this;

  /// # [h(context)] Get the size as a percentage of the screen height
  double h(BuildContext context) => BaseUtils.getScreenHeight(context) * this;

  /// # [r(context)] Get the standard ratio compared to the design screen size
  double r(BuildContext context, {double defaultScreenWidth = 390}) =>
      (this / defaultScreenWidth) * BaseUtils.getScreenWidth(context);
}
