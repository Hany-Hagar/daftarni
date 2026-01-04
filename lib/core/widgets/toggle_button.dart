import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MToggleButton extends StatelessWidget {
  final double? width;
  final double? fontSize;
  final int currentSelect;
  final List<String>? texts;
  final List<Widget>? buttons;
  final Color? color;
  final Color? fontColor;
  final Color? borderColor;
  final Function(int)? onPressed;
  const MToggleButton({
    super.key,
    this.width,
    required this.currentSelect,
    this.texts,
    required this.onPressed,
    this.fontSize,
    this.color,
    this.fontColor,
    this.borderColor,
    this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).primaryColor;
    final fontColor = this.fontColor ?? color;
    final width = this.width ?? MediaQuery.of(context).size.width - 36.w;
    final length = texts?.length ?? buttons?.length ?? 1;

    return ToggleButtons(
      borderColor: borderColor ?? color,
      fillColor: color,
      selectedBorderColor: color,
      onPressed: (index) => onPressed?.call(index),
      constraints: BoxConstraints.expand(width: width / length, height: 45.h),
      borderRadius: BorderRadius.circular(10.r),
      isSelected: List.generate(length, (i) => currentSelect == i),
      children:
          buttons ??
          List.generate(
            length,
            (index) => CustomText(
              isHead: true,
              title: texts![index],
              fontSize: fontSize ?? 25.sp,
              fontColor: currentSelect == index ? Colors.white : fontColor,
            ),
          ),
    );
  }
}
