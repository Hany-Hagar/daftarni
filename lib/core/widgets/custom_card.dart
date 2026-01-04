import 'custom_text.dart';
import '../../const_data/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String emoji;
  final MainAxisAlignment? titleAlign;
  final double? sizeBoxHeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  const CustomCard({
    super.key,
    required this.emoji,
    required this.title,
    this.titleAlign,
    this.sizeBoxHeight,
    this.padding,
    this.margin,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: defaultBoxShadow,
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: titleAlign ?? MainAxisAlignment.start,
            children: [
              CustomText(isHead: true, title: emoji, fontSize: 20),
              SizedBox(width: 10.w),
              CustomText(isHead: true, title: title, fontSize: 24),
            ],
          ),
          SizedBox(height: sizeBoxHeight?.h ?? 12.h),
          child,
        ],
      ),
    );
  }
}
