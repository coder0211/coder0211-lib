import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';

/// # BaseProcessBar Widget
class BaseProcessBar extends StatefulWidget {
  /// Param [currentExp] The current experience of the user
  final int currentExp;

  /// Param [expLevel] The experience level of the user
  final int expLevel;

  /// Param [width] The width of the widget
  final double width;

  /// Param [height] The height of the widget
  final double? height;

  /// Param [time] The time of animation
  final int? time;

  /// Param [bgColor] The background color of the widget
  final Color bgColor;

  /// Param [foregroundColor] The foreground color of the widget
  final Color foregroundColor;

  /// Param [radius] The radius of the widget
  final double? radius;
  const BaseProcessBar(
      {Key? key,
      required this.currentExp,
      required this.expLevel,
      required this.width,
      this.time,
      required this.bgColor,
      required this.foregroundColor,
      this.height,
      this.radius})
      : super(key: key);

  @override
  _BaseProcessBarState createState() => _BaseProcessBarState();
}

class _BaseProcessBarState extends State<BaseProcessBar>
    with SingleTickerProviderStateMixin {
  /// Declare the animation controller
  late AnimationController _animationController;

  ///Declare the animation
  late Animation<double> _animation;

  @override
  void initState() {
    /// Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.time ?? 250),
    );
    _animation = Tween<double>(
            begin: 0.0, end: widget.currentExp / widget.expLevel * widget.width)
        .animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });

    /// Start the animation controller
    BaseUtils.onWidgetBuildDone(_startAnimation, context);
    super.initState();
  }

  @override
  void dispose() {
    /// Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customContainerProcess(color: widget.bgColor, data: widget.width),
        _customContainerProcess(
            color: widget.foregroundColor, data: _animation.value)
      ],
    );
  }

  Widget _customContainerProcess({required double data, required Color color}) {
    return Container(
      height: widget.height ?? 6,
      width: data,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 5))),
    );
  }

  /// Start the animation controller
  void _startAnimation() {
    _animationController.forward();
  }
}
