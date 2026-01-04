import '../set_category_button.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionCategory extends StatelessWidget {
  final bool isIncome;
  final List<CategoryModel> categories;
  const AddTransactionCategory({
    super.key,
    required this.isIncome,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return CustomCard(
          emoji: '🏷️',
          title: s.category,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          child: SetCategoryButton(isIncome: isIncome),
        );
      },
    );
  }
}
