// ignore_for_file: deprecated_member_use

import '../custom_icon.dart';
import 'package:flutter/material.dart';
import '../../../../../../const_data/app.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../data/models/quick_action_model.dart';
import '../../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/utils/navigator_methods.dart';

class LayoutQuickActions extends StatelessWidget {
  const LayoutQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_Top(), _QuickActions(), SizedBox(height: 5.h)],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(isHead: true, title: S.of(context).quickActions),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10.w,
          children: List.generate(
            2,
            (index) => Expanded(
              child: _QuickActionItem(
                model: quickActions(context: context)[index],
              ),
            ),
          ),
        ),

        SizedBox(height: 10.h),

        SizedBox(
          width: double.infinity,
          child: _QuickActionItem(
            model: quickActions(context: context)[2], // Analysis مثلا
          ),
        ),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final QuickActionModel model;

  const _QuickActionItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LayoutCubit.get(context).clearTransactionData();
        NavTo.push(context: context, nextPage: model.nextPage);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          boxShadow: defaultBoxShadow,
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            SizedBox(height: 3.h),
            CustomIcon(color: model.color, icon: model.icon, readius: 24),
            SizedBox(height: 8.h),
            CustomText(isHead: true, title: model.title, fontSize: 20.sp),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
