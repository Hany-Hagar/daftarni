// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_card.dart';
import '../../../../../../core/widgets/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionValue extends StatelessWidget {
  final String amountTitle;
  const AddTransactionValue({super.key, required this.amountTitle});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return CustomCard(
      emoji: "💰",
      title: amountTitle,
      titleAlign: MainAxisAlignment.center,
      padding: EdgeInsets.only(top: 10.h),
      child: UTextFormField(
        height: 55.h,
        hintText: "0.0",
        cursorHeight: 50.h,
        border: InputBorder.none,
        textAlign: TextAlign.center,
        controller: cubit.addTransactionValue,
        keyboardType: TextInputType.number,
        backgroundColor: Colors.transparent,
        onChanged: (p0) => cubit.addTransactionValidate(),
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
