import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///[extension TextEX]
///[USING] <String>.<Name()>
///[EXAMPLE] hello.d1()
extension TextEX on String {
  /// # [d1] return text with style d1,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1,
  /// * param[fontSize] font size = 42,
  /// * param[fontWeight] font weight = FontWeight.w300,
  Widget d1(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 42, color: color, fontWeight: FontWeight.w300));
  }

  /// # [h1R] return text with style h1 regular,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 36,
  /// * param[fontWeight] font weight = FontWeight.w400,
  Widget h1R(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 36, color: color, fontWeight: FontWeight.w400));
  }

  /// # [t1M] return text with style t1 medium,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 28,
  /// * param[fontWeight] font weight = FontWeight.w500,
  Widget t1M(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 28, color: color, fontWeight: FontWeight.w500));
  }

  /// # [t2R] return text with style t2 regular,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 20,
  /// * param[fontWeight] font weight = FontWeight.w400,
  Widget t2R(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 20, color: color, fontWeight: FontWeight.w400));
  }

  /// # [b1R] return text with style b1 regular,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 16,
  /// * param[fontWeight] font weight = FontWeight.w400,
  Widget b1R(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 16, color: color, fontWeight: FontWeight.w400));
  }

  /// # [b2R] return text with style b2 regular,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 14,
  /// * param[fontWeight] font weight = FontWeight.w400,
  Widget b2R(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 14, color: color, fontWeight: FontWeight.w400));
  }

  /// # [b1] return text with style b1,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 16,
  /// * param[fontWeight] font weight = FontWeight.bold,
  Widget b1(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 16, color: color, fontWeight: FontWeight.bold));
  }

  /// # [b2] return text with style b2,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 14,
  /// * param[fontWeight] font weight = FontWeight.bold,
  Widget b2(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 14, color: color, fontWeight: FontWeight.bold));
  }

  /// # [labelR] return text with style label regular,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 11,
  /// * param[fontWeight] font weight = FontWeight.w400,
  Widget labelR(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 11, color: color, fontWeight: FontWeight.w400));
  }

  /// # [labelB] return text with style label bold,
  /// * param[color] color = Colors.black,
  /// * param[textAlign] textAlign = TextAlign.start,
  /// * param[maxLines] maxLines = 1 (default),
  /// * param[fontSize] font size = 11,
  /// * param[fontWeight] font weight = FontWeight.bold,
  Widget labelB(
      {Color color = Colors.black,
      TextAlign textAlign = TextAlign.start,
      int maxLines = 1}) {
    return BaseText(this,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.notoSans(
            fontSize: 11, color: color, fontWeight: FontWeight.bold));
  }
}
