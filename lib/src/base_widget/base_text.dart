import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final double? minFontSize;

  const BaseText(this.text,
      {this.style,
      this.textAlign,
      this.maxLines,
      this.textOverflow = TextOverflow.ellipsis,
      this.minFontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        overflow: textOverflow,
        textAlign: textAlign,
        maxLines: maxLines,
        style: (style ?? const TextStyle()).copyWith(wordSpacing: 0.4));
  }
}
