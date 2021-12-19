import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class BaseIndicator extends StatelessWidget {
  final List<Color>? colorsIndicator;
  const BaseIndicator({Key? key, this.colorsIndicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      indicatorType: Indicator.ballClipRotatePulse,
      colors: colorsIndicator ?? [Colors.blue, Colors.purple],
      strokeWidth: 5,
    );
  }
}