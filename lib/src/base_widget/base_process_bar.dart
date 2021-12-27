import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';

class BaseProcessBar extends StatefulWidget {
  final int currentExp;
  final int expLevel;
  final double width;
  final int? time;
  final Color bgColor;
  final Color foregroundColor;
  final double? height;
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
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
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

  void _startAnimation() {
    _animationController.forward();
  }
}
