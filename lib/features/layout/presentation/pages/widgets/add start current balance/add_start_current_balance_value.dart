import 'package:flutter/material.dart';
import '../glass_text_form_filed.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStartCurrentBalanceValue extends StatelessWidget {
  const AddStartCurrentBalanceValue({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      children: [
        SizedBox(height: 20.h),
        GlassTextFormField(
          padding: EdgeInsets.symmetric(vertical: 14.w),
          prefixIcon: Icons.monetization_on_outlined,
          title: S.of(context).addStartCurrentBalanceHint,
          controller: cubit.addTransactionValue,
          keyboardType: TextInputType.number,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: theme.dividerColor),
          ),
          hintStyle: TextStyle(
            fontSize: 14.sp,
            // ignore: deprecated_member_use
            color: theme.hintColor.withOpacity(0.8),
          ),
          inputStyle: TextStyle(fontSize: 16.sp, color: theme.hintColor),
        ),

        SizedBox(height: 15.h),
      ],
    );
  }
}
