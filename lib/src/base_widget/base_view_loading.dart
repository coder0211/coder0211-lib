import 'package:coder0211/src/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import '../../coder0211.dart';

class BaseViewLoading extends StatelessWidget {
  final Color backgroundColor;
  final Widget? child;
  final bool? isLoading;
  final double? paddingBottom;
  final List<Color>? colorsIndicator;

  BaseViewLoading(
      {required this.child,
      required this.isLoading,
      this.backgroundColor = Colors.grey,
      this.paddingBottom,
      this.colorsIndicator});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      child!,
      if (isLoading!)
        Container(
            width: 1.w,
            height: BaseUtils.getScreenHeight(context),
            color: backgroundColor.withOpacity(0.2),
            child: Padding(
                padding: EdgeInsets.only(bottom: paddingBottom ?? 0.0),
                child: Center(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child:
                            BaseIndicator(colorsIndicator: colorsIndicator)))))
      else
        Container()
    ]);
  }
}
