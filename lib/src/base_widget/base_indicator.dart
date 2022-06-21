import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

/// # [BaseIndicator] is a base class for all indicator widgets
class BaseIndicator extends StatelessWidget {
  final List<Color>? colorsIndicator;
  const BaseIndicator({Key? key, this.colorsIndicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 52,
        height: 52,
        child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotatePulse,
          colors: colorsIndicator ??
              [const Color(0xff96BAEC), const Color(0xffFFC48D)],
          strokeWidth: 5,
        ),
      ),
    );
  }
}
