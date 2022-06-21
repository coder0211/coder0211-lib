import 'package:flutter/material.dart';

import '../../coder0211.dart';

class BaseGridAnswer extends StatefulWidget {
  final List<String> answers;
  final int indexCorrect;
  final double screenPadding;
  final TextStyle? style;
  final TextStyle? styleHepper;
  final Function onPressed;
  final Function onPressedHepler;
  const BaseGridAnswer(
      {Key? key,
      required this.answers,
      required this.indexCorrect,
      this.screenPadding = 20,
      this.style,
      this.styleHepper,
      required this.onPressed,
      required this.onPressedHepler})
      : super(key: key);

  @override
  _BaseGridAnswerState createState() => _BaseGridAnswerState();
}

class _BaseGridAnswerState extends State<BaseGridAnswer> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            child: Column(
          children: [
            Row(
              children: [
                customAnswerTab(0, answer: widget.answers[0]),
                customAnswerTab(1, answer: widget.answers[1])
              ],
            ),
            Row(
              children: [
                customAnswerTab(2, answer: widget.answers[2]),
                customAnswerTab(3, answer: widget.answers[3])
              ],
            )
          ],
        )),
        GestureDetector(
          onTap: () {
            widget.onPressedHepler.call();
          },
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                  spreadRadius: 3)
            ], shape: BoxShape.circle, color: Colors.green),
            alignment: Alignment.center,
            height: 100,
            width: 100,
            child: BaseText(
              'OK',
              style: widget.styleHepper,
            ),
          ),
        )
      ],
    );
  }

  Widget customAnswerTab(int id, {required String answer}) {
    return GestureDetector(
      onTap: () {
        if (!isPressed) widget.onPressed.call(id == widget.indexCorrect);
        isPressed = true;
      },
      child: Container(
        margin: EdgeInsets.only(
          left: id % 2 == 0 ? widget.screenPadding : widget.screenPadding / 2,
          right: id % 2 == 0 ? widget.screenPadding / 2 : widget.screenPadding,
          bottom: id < 2 ? widget.screenPadding : 0,
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                  spreadRadius: 3)
            ],
            color: Colors.amber,
            borderRadius: const BorderRadius.all(const Radius.circular(15))),
        height: BaseUtils.getScreenWidth(context) / 2 - 30,
        width: BaseUtils.getScreenWidth(context) / 2 - 30,
        child: Center(child: BaseText(answer, style: widget.style)),
      ),
    );
  }
}
