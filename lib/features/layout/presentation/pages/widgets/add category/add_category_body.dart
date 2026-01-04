import 'add_category_body_top.dart';
import 'add_category_body_icon.dart';
import 'add_category_body_name.dart';
import 'add_category_body_color.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryBody extends StatelessWidget {
  final bool isIncome;
  const AddCategoryBody({super.key, required this.isIncome});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      spacing: 8.h,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AddCategoryBodyTop(),
        AddCategoryBodyName(),
        AddCategoryBodyIcon(),
        AddCategoryBodyColor(),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => CustomLoadingButton(
                isEnabled: !cubit.addingCategoryEmpty,
                isLoading: cubit.loadingAddCategory,
                title: s.createCategoryButton,
                onTap: () => cubit.addCategory(isIncome: isIncome),
              ),
        ),
      ],
    );
  }
}
