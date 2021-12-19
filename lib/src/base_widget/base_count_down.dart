import 'package:flutter/material.dart';

import '../../coder0211.dart';

class BaseCountDown extends StatefulWidget {
  final int timeSeconds;
  final Function whenCompleted;
  final double? height;
  final double? radius;
  const BaseCountDown(
      {Key? key,
      required this.timeSeconds,
      required this.whenCompleted,
      this.height,
      this.radius})
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
            color: Colors.grey, data: BaseUtils.getScreenWidth(context)),
        _customContainerProcess(
            color: Colors.blue,
            data: BaseUtils.getScreenWidth(context) *
                (_animation.value / (widget.timeSeconds * 1000.0)))
      ],
    );
  }

  Widget _customContainerProcess({required double data, required Color color}) {
    return Container(
      height: widget.height ?? 10,
      width: data,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 0))),
    );
  }

  void _startAnimation() {
    _animationController.forward();
  }
}
