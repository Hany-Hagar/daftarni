// ignore_for_file: deprecated_member_use, unused_element_parameter

import 'package:flutter/material.dart';
import '../../../../../../const_data/app.dart';
import '../../../../../../const_data/data.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../analysis/presentation/views/pages/download_report_view.dart';

class LayoutCurrentBalance extends StatelessWidget {
  const LayoutCurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    var fontColor = Colors.white;
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder:
          (context, state) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: linearGradient,
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Top(fontColor: fontColor),
                SizedBox(height: 10),
                _Body(fontColor: fontColor),
                SizedBox(height: 12.h),
                CustomButton(
                  onPressed: () async {
                    NavTo.push(
                      context: context,
                      nextPage: DownloadReportView(),
                    );
                  },
                  text: S.of(context).monthlyReportButton,
                  backgroundColor: fontColor.withOpacity(0.2),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
    );
  }
}

class _Top extends StatelessWidget {
  final Color fontColor;
  const _Top({required this.fontColor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context).data.profile;
    return ListTile(
      tileColor: Colors.transparent,
      contentPadding: EdgeInsetsDirectional.only(end: 10.w),
      title: CustomText(
        isHead: true,
        title: s.currentBalance,
        fontSize: 20.sp,
        fontColor: fontColor,
      ),
      subtitle: CustomText(
        isHead: true,
        title: ' \$ ${cubit.balance.currentBalance}',
        fontSize: 32.sp,
        fontColor: fontColor,
      ),
      trailing: _CustomProgress(
        progress: cubit.balance.progress,
        fontColor: fontColor,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Color fontColor;

  const _Body({required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: List.generate(2, (index) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: fontColor.withOpacity(0.24),
              border: Border.all(color: fontColor, width: 0.5),
            ),
            child: _BalanceItem(
              fontColor: fontColor,
              isIncomeOperation: index == 0,
            ),
          ),
        );
      }),
    );
  }
}

class _BalanceItem extends StatelessWidget {
  final Color fontColor;
  final bool isIncomeOperation;
  const _BalanceItem({
    super.key,
    required this.fontColor,
    required this.isIncomeOperation,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var data = LayoutCubit.get(context).data.profile;
    var title = isIncomeOperation ? s.income : s.expense;
    var balance = data.balance;
    var value = isIncomeOperation ? balance.income : balance.expense;
    var icon = isIncomeOperation ? Icons.arrow_downward : Icons.arrow_upward;
    var backgroundColor = isIncomeOperation ? incomeColor : expenseColor;
    return Container(
      padding: EdgeInsets.all(10.h),
      child: Column(
        spacing: 0.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                radius: 11.r,
                backgroundColor: backgroundColor,
                child: Icon(icon, color: fontColor, size: 18.r),
              ),
              CustomText(
                isHead: true,
                title: title,
                fontSize: 20,
                fontColor: fontColor,
              ),
            ],
          ),
          CustomText(
            isHead: true,
            title: '\$ $value',
            fontSize: 22.sp,
            fontColor: fontColor,
          ),
        ],
      ),
    );
  }
}

class _CustomProgress extends StatelessWidget {
  final Color fontColor;
  final double progress;
  final double size;

  const _CustomProgress({
    required this.progress,
    this.size = 28,
    required this.fontColor,
  });
  @override
  Widget build(BuildContext context) {
    var color =
        progress > 1
            ? const Color.fromARGB(192, 244, 67, 54)
            : const Color.fromARGB(189, 52, 199, 89);
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: (size - 2).r,
          backgroundColor: fontColor.withOpacity(0.2),
        ),
        CircularProgressIndicator(
          value: progress,
          strokeWidth: (size + 8).r,
          color: color,
          backgroundColor: fontColor.withOpacity(0.2),
        ),
        CustomText(
          isHead: true,
          title: formatProgress(progress),
          fontSize: 20.sp,
          fontColor: fontColor,
        ),
      ],
    );
  }

  String formatProgress(double progress) {
    double value = progress * 100;
    double rounded = value.roundToDouble();

    if ((value - rounded).abs() < 0.01) {
      // الفرق صغير جدًا → اعتبره صحيح
      return '${rounded.toInt()}%';
    } else {
      return '${value.toStringAsFixed(2)} %';
    }
  }
}
