// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionValue extends StatelessWidget {
  final String amountTitle;
  final TextEditingController controller;
  final dynamic Function(String?)? onChanged;
  const AddTransactionValue({
    super.key,
    required this.amountTitle,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      emoji: "💰",
      title: amountTitle,
      titleAlign: MainAxisAlignment.center,
      padding: EdgeInsets.only(top: 10.h),
      child: UTextFormField(
        height: 55.h,
        hintText: "0.0",
        cursorHeight: 50.h,
        onChanged: onChanged,
        controller: controller,
        border: InputBorder.none,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.only(bottom: 12.h),
        inputStyle: Styles.textStyle700.copyWith(
          fontSize: 60.sp,
          color: Theme.of(context).hintColor,
        ),
        hintStyle: Styles.textStyle700.copyWith(
          fontSize: 60.sp,
          color: Theme.of(context).hintColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
