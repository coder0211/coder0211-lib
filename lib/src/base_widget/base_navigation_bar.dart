import 'package:coder0211/src/base_widget/base_svg.dart';
import 'package:coder0211/src/base_widget/base_text.dart';
import 'package:flutter/material.dart';

/// #
class BaseNavigationBar extends StatelessWidget {
  final Color? bgColor;
  final double? radius;
  final double? containerHeight;
  final List<BaseNavigationBarItem> items;
  final Function(int) onItemSelected;
  final Color? color;
  final Color? selectedColor;
  final TextStyle style;
  final double? heightIcon;
  final double? widthIcon;
  final int indexSlelected;
  const BaseNavigationBar({
    Key? key,
    this.bgColor,
    this.radius,
    this.containerHeight,
    required this.items,
    required this.onItemSelected,
    this.color,
    this.selectedColor,
    required this.style,
    this.heightIcon,
    this.widthIcon,
    required this.indexSlelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: bgColor ?? const Color(0xffFCFCFF),
          boxShadow: [
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
                      icon: index == indexSlelected
                          ? item.iconSelected
                          : item.icon,
                      style: style,
                      title: item.title,
                      height: heightIcon ?? 30,
                      width: widthIcon ?? 30));
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
  const _BaseNavigationBarItemWidget(
      {Key? key,
      required this.icon,
      required this.style,
      required this.color,
      this.height,
      this.width,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.transparent,
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          BaseSVG(path: icon, width: width, height: height, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: BaseText(title, style: style.copyWith(color: color)),
          )
        ],
      ),
    );
  }
}

class BaseNavigationBarItem {
  final String icon;
  final String iconSelected;
  final String title;
  BaseNavigationBarItem(
      {required this.icon, required this.title, required this.iconSelected});
}
