import 'package:flutter/material.dart';
import '../../manager/layout_cubit.dart';
import '../../manager/layout_states.dart';
import 'package:daftarni/Const/data.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/toggle_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypeToggle extends StatelessWidget {
  const TypeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    List<String> types = [s.all, s.income, s.expense];
    List<Color> colors = [Color(0xFF03A9F4), incomeColor, expenseColor];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.h),
        CustomText(title: s.categoryType, fontSize: 23.sp, isHead: true),
        SizedBox(height: 10.h),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => MToggleButton(
                texts: types,
                color: colors[cubit.filterCategoryType],
                currentSelect: cubit.filterCategoryType,
                onPressed: (p0) => cubit.changeFilterType(p0),
              ),
        ),
      ],
    );
  }
}
