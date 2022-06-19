import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// # [BaseSvg] is a widget that displays an SVG image.
/// * param[path] is the path of the SVG image.
/// * param[width] is the width of the SVG image.
/// * param[height] is the height of the SVG image.
/// * param[color] is the color of the SVG image.
/// * param[fit] is the fit of the SVG image.
class BaseSVG extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  BaseSVG(
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
