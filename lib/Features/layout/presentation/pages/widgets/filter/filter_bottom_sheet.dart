import '../type_toggle.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatelessWidget {
  final Widget? body;
  final Function()? applyPressed;
  const FilterBottomSheet({super.key, this.body, required this.applyPressed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final cubit = LayoutCubit.get(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!cubit.filteringOpen) {
        cubit.clearFilterData();
      }
    });
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.h),
          CustomText(title: s.searchOptions, isHead: true, fontSize: 25),
          SizedBox(height: 5.h),
          if (cubit.filteringOpen)
            GestureDetector(
              onTap: () {
                cubit.clearFilterData();
              },
              child: CustomText(
                fontSize: 18,
                title: s.clearFilterData,
                fontColor: Theme.of(context).primaryColor,
              ),
            ),
          TypeToggle(),
          body ?? SizedBox.shrink(),
          SizedBox(height: 20.h),
          _Action(onPressed: applyPressed),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final dynamic Function()? onPressed;
  const _Action({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 55.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 24.sp,
                  color: theme.hintColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(child: CustomButton(text: s.apply, onPressed: onPressed)),
          ],
        ),
        SizedBox(height: 15.h),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
