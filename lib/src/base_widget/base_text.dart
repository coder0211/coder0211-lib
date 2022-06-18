import 'package:auto_size_text/auto_size_text.dart';
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
      this.textOverflow = TextOverflow.visible,
      this.minFontSize});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text ?? '',
        overflow: textOverflow,
        textAlign: textAlign,
        maxLines: maxLines,
        minFontSize: minFontSize ?? 10,
        style: style);
  }
}

extension A on String {
  Widget h1(Color color) {
    return BaseText(this, style: TextStyle(fontSize: 24, color: color));
  }
}
