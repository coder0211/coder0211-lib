import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function onPressed;
  final BorderSide borderSide;
  final BorderRadiusGeometry? borderRadius;
  final Color? bgColor;
  final double? height;
  final Widget child;
  final Color? splashColor;
  const BaseButton({
    Key? key,
    required this.onPressed,
    this.height,
    this.bgColor,
    this.borderRadius,
    this.borderSide = BorderSide.none,
    required this.child,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: height ?? 52,
        splashColor: splashColor,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15),
            side: borderSide),
        color: bgColor ?? Colors.blue,
        onPressed: () {
          onPressed.call();
        },
        child: child);
  }
}
