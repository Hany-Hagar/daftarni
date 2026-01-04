import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class AddCategoryBodyName extends StatelessWidget {
  const AddCategoryBodyName({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.categoryName),
        SizedBox(height: 8.h),
        UTextFormField(
          hintText: s.categoryNameHint,
          controller: cubit.categoryTitle,
          onChanged: (p0) => cubit.addCategoryValidateFunc(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
