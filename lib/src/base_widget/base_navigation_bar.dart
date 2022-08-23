import 'package:coder0211/src/base_widget/base_svg.dart';
import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// #
class BaseNavigationBar extends StatelessWidget {
  final Color? bgColor;
  final double? radius;
  final double? containerHeight;
  final List<BaseNavigationBarItem> items;
  final Function(int) onItemSelected;
  final Color? color;
  final Color? selectedColor;
  final TextStyle? style;
  final double? heightIcon;
  final double? widthIcon;
  final int indexSlelected;
  final bool? isShowText;
  final List<BoxShadow>? boxShadow;
  const BaseNavigationBar(
      {Key? key,
      this.bgColor,
      this.radius,
      this.containerHeight,
      required this.items,
      required this.onItemSelected,
      this.color,
      this.selectedColor,
      this.style,
      this.heightIcon,
      this.widthIcon,
      required this.indexSlelected,
      this.isShowText,
      this.boxShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: bgColor ?? const Color(0xffFCFCFF),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    blurRadius: 7,
                    offset: const Offset(4, 4),
                    color: const Color(0xffC9CADF).withOpacity(0.55)),
              ],
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 50))),
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: containerHeight ?? 65,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: _BaseNavigationBarItemWidget(
                      color: index == indexSlelected
                          ? (selectedColor ?? const Color(0xffFF8181))
                          : (color ?? const Color(0xff797979)),
                      icon: item.icon,
                      style: style ??
                          GoogleFonts.notoSans(
                              fontWeight: FontWeight.w500, fontSize: 12),
                      title: item.title,
                      height: heightIcon ?? 30,
                      width: widthIcon ?? 30,
                      isShowText: isShowText ?? true));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BaseNavigationBarItemWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final TextStyle style;
  final double? height, width;
  final String title;
  final bool isShowText;
  const _BaseNavigationBarItemWidget(
      {Key? key,
      required this.icon,
      required this.style,
      required this.color,
      required this.height,
      required this.width,
      required this.title,
      required this.isShowText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.transparent,
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseSVG(path: icon, width: width, height: height, color: color),
          isShowText
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: BaseText(title, style: style.copyWith(color: color)),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class BaseNavigationBarItem {
  final String icon;
  final String title;
  BaseNavigationBarItem({required this.icon, required this.title});
}
