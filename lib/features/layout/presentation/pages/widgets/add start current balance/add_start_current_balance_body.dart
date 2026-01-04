import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import 'add_start_current_balance_value.dart';
import '../../../../../../generated/l10n.dart';
import 'add_start_current_balance_category.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class AddStartCurrentBalanceBody extends StatelessWidget {
  const AddStartCurrentBalanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(14.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).dialogTheme.backgroundColor,
      ),
      child: Column(
        children: [
          Image.asset("assets/images/wallet.png", width: 100.w, height: 100.h),
          CustomText(
            isHead: true,
            title: s.addStartCurrentBalanceTitle,
            fontSize: 22,
          ),
          SizedBox(height: 5.h),
          CustomText(
            title: s.addStartCurrentBalanceSubtitle,
            fontSize: 18,
            textAlign: TextAlign.center,
          ),
          AddStartCurrentBalanceValue(),
          AddStartCurrentBalanceCategory(),
          SizedBox(height: 20.h),
          const _Actions(),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SizedBox(
      height: 40.h,
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(
            child: CustomButton(
              text: s.save,
              onPressed: () {
                LayoutCubit.get(context).validateValue(isExpense: false);
                NavTo.pop(context);
              },
              backgroundColor: Colors.green,
            ),
          ),
          Expanded(
            child: CustomButton(
              text: s.skip,
              onPressed: () {
                NavTo.pop(context);
              },
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
