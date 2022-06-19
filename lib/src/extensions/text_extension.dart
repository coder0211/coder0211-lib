import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TextEX on String {
  Widget d1({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 42, color: color, fontWeight: FontWeight.w300));
  }

  Widget h1R({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 36, color: color, fontWeight: FontWeight.w400));
  }

  Widget t1M({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 28, color: color, fontWeight: FontWeight.w500));
  }

  Widget t2R({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 20, color: color, fontWeight: FontWeight.w400));
  }

  Widget b1R({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 16, color: color, fontWeight: FontWeight.w400));
  }

  Widget b2R({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 14, color: color, fontWeight: FontWeight.w400));
  }

  Widget b1({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 16, color: color, fontWeight: FontWeight.bold));
  }

  Widget b2({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 14, color: color, fontWeight: FontWeight.bold));
  }

  Widget labelR({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 1, color: color, fontWeight: FontWeight.w400));
  }

  Widget labelB({Color? color}) {
    return BaseText(this,
        style: GoogleFonts.notoSans(
            fontSize: 1, color: color, fontWeight: FontWeight.bold));
  }
}
