import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassTextFormField extends StatelessWidget {
  final InputBorder? border;
  final double height;
  final String? title;
  final EdgeInsets? padding;
  final int maxLines;
  final bool readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final dynamic Function(String?)? onChanged;
  final VoidCallback? onTap;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;

  const GlassTextFormField({
    super.key,
    this.border,
    this.onTap,
    this.onChanged,
    this.maxLines = 1,
    this.height = 42.5,
    required this.title,
    this.padding,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    required this.controller,
    required this.keyboardType,
    this.hintStyle,
    this.inputStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child:
          UTextFormField(
            onTap: onTap,
            height: height.h,
            hintText: title,
            maxLines: maxLines,
            readOnly: readOnly,
            controller: controller,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: border ?? InputBorder.none,
            hintStyle: hintStyle,
            inputStyle: inputStyle,
            padding: padding,
            keyboardType: keyboardType,
            onChanged: onChanged,
          ).asGlass(),
    );
  }
}
