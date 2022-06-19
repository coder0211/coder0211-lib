import 'package:flutter/material.dart';

/// # [BaseButton] is a button with a rounded border and a shadow.
/// * Param [height] is the height of the button.(default: 52)
/// * Param [borderRadius] is the radius of the border.(default: 10)
/// * Param [bgColor] is the background color of the button.(default: Colors.blue)
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
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: borderSide),
        color: bgColor ?? Colors.blue,
        onPressed: () {
          onPressed.call();
        },
        child: child);
  }
}
