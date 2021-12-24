import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseSVGIcon extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  BaseSVGIcon(
      {Key? key,
      required this.path,
      this.width,
      this.height,
      this.color,
      this.fit = BoxFit.contain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path,
        color: color, width: width, height: height, fit: fit);
  }
}
