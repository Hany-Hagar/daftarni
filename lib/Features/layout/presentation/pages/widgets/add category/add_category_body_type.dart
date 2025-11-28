import 'package:flutter/material.dart';
import '../../../../../../const/app.dart';
import '../../../../../../const/data.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryBodyType extends StatelessWidget {
  const AddCategoryBodyType({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.categoryType, fontSize: 25),
        SizedBox(height: 8.h, width: double.infinity),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => Row(
                spacing: 12.w,
                children: List.generate(2, (index) => _Type(index: index)),
              ),
        ),
      ],
    );
  }
}

class _Type extends StatelessWidget {
  final int index;
  const _Type({required this.index});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final cubit = LayoutCubit.get(context);
    int selectedItem = cubit.addCategoryType;
    final title = index == 0 ? s.income : s.expense;
    final bgColor = index == 0 ? incomeColor : expenseColor;
    final icon = index == 0 ? Icons.arrow_upward : Icons.arrow_downward;
    final itemColor = selectedItem == index ? Colors.white : theme.hintColor;

    return Expanded(
      child: GestureDetector(
        onTap: () => cubit.changeAddCategoryType(index),
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color:
                selectedItem == index ? bgColor : theme.scaffoldBackgroundColor,
            boxShadow: defaultBoxShadow,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Icon(icon, size: 30.sp, color: itemColor),
              SizedBox(height: 5.h),
              CustomText(
                isHead: true,
                title: title,
                fontSize: 20,
                fontColor: itemColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
