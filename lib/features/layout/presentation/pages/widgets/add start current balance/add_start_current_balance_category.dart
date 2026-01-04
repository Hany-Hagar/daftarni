import '../set_category_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddStartCurrentBalanceCategory extends StatelessWidget {
  const AddStartCurrentBalanceCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Top(),
        SizedBox(height: 10.h),
        SetCategoryButton(isIncome: true),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        CustomText(isHead: true, title: "🏷️"),
        CustomText(isHead: true, title: S.of(context).category),
      ],
    );
  }
}
