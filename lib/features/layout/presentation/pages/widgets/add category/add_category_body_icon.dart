import '../custom_icon.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../icon_picker/data/model/icon_picker_model.dart';

class AddCategoryBodyIcon extends StatelessWidget {
  const AddCategoryBodyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.categoryIcon),
        SizedBox(height: 8.h),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder: (context, state) => _Body(),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = LayoutCubit.get(context);
    var leadingIcon = cubit.categoryIcon ?? Icons.category;
    var title = cubit.categoryIconHint ?? s.categoryIconHint;
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        onTap: () async {
          IconPickerModel icon = await DialogServices.iconPicker(
            context: context,
          );
          cubit.changeCategoryIcon(icon.icon, s.selectedIcon);
        },
        leading: CustomIcon(icon: leadingIcon, color: cubit.categoryColor),
        title: CustomText(title: title, fontSize: 20),
        trailing: Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: Icon(
            cubit.categoryIcon,
            size: 45.r,
            color: Color(cubit.categoryColor),
          ),
        ),
      ),
    );
  }
}
