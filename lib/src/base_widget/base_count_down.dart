import 'package:coder0211/src/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import '../../coder0211.dart';

class BaseCountDown extends StatefulWidget {
  final int timeSeconds;
  final Function whenCompleted;
  final double? height;
  final double? radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const BaseCountDown(
      {Key? key,
      required this.timeSeconds,
      required this.whenCompleted,
      this.height,
      this.radius,
      this.backgroundColor,
      this.foregroundColor})
      : super(key: key);

  @override
  _BaseCountDownState createState() => _BaseCountDownState();
}

class _BaseCountDownState extends State<BaseCountDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.timeSeconds),
    );
    _animation = Tween<double>(begin: widget.timeSeconds * 1000.0, end: 0.0)
        .animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.whenCompleted.call();
      }
    });
    BaseUtils.onWidgetBuildDone(_startAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customContainerProcess(
            color: widget.backgroundColor ?? Colors.grey, data: 1.w),
        _customContainerProcess(
            color: widget.foregroundColor ?? Colors.blue,
            data: 1.w * (_animation.value / (widget.timeSeconds * 1000.0)))
      ],
    );
  }

  Widget _customContainerProcess({required double data, required Color color}) {
    return Container(
        height: widget.height ?? 10,
        width: data,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 0)),
        ));
  }

  void _startAnimation() {
    _animationController.forward();
  }
}
