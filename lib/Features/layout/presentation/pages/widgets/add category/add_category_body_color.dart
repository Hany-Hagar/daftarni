// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/utils/dialog_services.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryBodyColor extends StatelessWidget {
  const AddCategoryBodyColor({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.categoryColor),
        SizedBox(height: 8.h),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => CustomButton(
                backgroundColor: Color(cubit.categoryColor),
                icon: Icons.color_lens,
                text: s.categoryColorHint,
                onPressed: () async {
                  Color color = await DialogServices.showColorDialog(
                    context: context,
                    color: Color(cubit.categoryColor),
                  );
                  cubit.changeCategoryColor(color.value);
                },
              ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
