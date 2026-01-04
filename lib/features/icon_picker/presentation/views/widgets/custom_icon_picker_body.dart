import 'list/icon_picker_models.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/icon_picker_cubit.dart';
import '../../../data/model/icon_picker_model.dart';
import '../../../../../Core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:daftarni/core/widgets/text_form_field.dart';

class CustomIconPickerBody extends StatelessWidget {
  final void Function(IconPickerModel) onPressed;

  const CustomIconPickerBody({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Search(),
        SizedBox(height: 12),
        Expanded(child: IconPickerModels(onPressed: onPressed)),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(
                isHead: true,
                title: S.of(context).close,
                fontSize: 26.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = IconPickerCubit.get(context);
    return Column(
      children: [
        SizedBox(height: 5.h),
        CustomText(isHead: true, title: s.iconPickerTitle, fontSize: 28.sp),
        SizedBox(height: 10.h),
        UTextFormField(
          controller: cubit.searchController,
          hintText: s.searchIcon,
          prefixIcon: Icons.search,
          border: UnderlineInputBorder(),
          padding: EdgeInsets.only(top: 5.h),
          onChanged: (p0) => cubit.searchIconsFunc(),
        ),
      ],
    );
  }
}
