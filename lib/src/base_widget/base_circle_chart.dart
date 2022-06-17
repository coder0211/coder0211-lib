import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BaseCircleChart extends StatefulWidget {
  double maxProgress;
  double? radius;
  double? width;
  double? height;
  int? duration;
  List<BoxShadow>? shadows;
  Color? backgroundPainter;
  Color? foregroundPainter;
  double? stockCircles;
  Widget? title;
  BaseCircleChart(
      {Key? key,
      required this.maxProgress,
      this.radius,
      this.width,
      this.height,
      this.shadows,
      this.duration,
      this.backgroundPainter,
      this.foregroundPainter,
      this.title})
      : super(key: key);

  @override
  State<BaseCircleChart> createState() => _BaseCircleChartState();
}

class _BaseCircleChartState extends State<BaseCircleChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration ?? 3000));
    _animation = Tween<double>(begin: 0.0, end: widget.maxProgress)
        .animate(_animationController);
    _animation.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: CircleChart(
            _animation.value,
            widget.radius ?? 50,
            widget.stockCircles,
            widget.backgroundPainter,
            widget.foregroundPainter),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: widget.shadows ??
                  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
          width: widget.width ?? 120,
          height: widget.height ?? 120,
          child: Center(child: widget.title),
        ));
  }
}

class CircleChart extends CustomPainter {
  double? stockCircles;
  double radius;
  double currentProgess;
  Color? backgroundPainter;
  Color? foregroundPainter;

  CircleChart(this.currentProgess, this.radius, this.stockCircles,
      this.backgroundPainter, this.foregroundPainter);
  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = stockCircles ?? 10.0
      ..color = backgroundPainter ?? Color(0xff0F218B)
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, circle);
    Paint animationArc = Paint()
      ..strokeWidth = stockCircles ?? 10.0
      ..color = foregroundPainter ?? Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double engle = 2 * pi * (currentProgess / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi, engle,
        false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
