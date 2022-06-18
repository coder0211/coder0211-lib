import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:flutter/material.dart';

extension StyleText on String {
  Widget h1(Color color) {
    return BaseText(this, style: TextStyle(fontSize: 24, color: color));
  }
}
