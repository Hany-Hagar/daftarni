import '../custom_icon.dart';
import 'package:glass/glass.dart';
import 'package:flutter/material.dart';
import '../List/select_categories.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_card.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionCategory extends StatelessWidget {
  final List<CategoryModel> categories;
  const AddTransactionCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        var category = categories[cubit.transactionCategory];
        var title = category.title[cubit.data.preferences.langI];
        return CustomCard(
          emoji: '🏷️',
          title: s.category,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
          child: ListTile(
            shape: _boder,
            onTap: () {
              DialogServices.showCleanDialog(
                context: context,
                child: _DialogBody(categories: categories),
              );
            },
            contentPadding: EdgeInsetsDirectional.only(start: 12.w, end: 6.w),
            leading: CustomIcon(color: category.color, icon: category.iconData),
            title: CustomText(
              isHead: true,
              fontSize: 23,
              title: title,
              maxLines: 2,
            ),
            trailing: Padding(
              padding: EdgeInsetsDirectional.only(end: 7.w),
              child: Icon(
                Icons.edit_outlined,
                size: 25.r,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ).asGlass(clipBorderRadius: BorderRadius.circular(12.r)),
        );
      },
    );
  }
}

var _boder = RoundedRectangleBorder(
  side: BorderSide.none,
  borderRadius: BorderRadius.circular(12.r),
);

class _DialogBody extends StatelessWidget {
  final List<CategoryModel> categories;
  const _DialogBody({required this.categories});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomCard(
      emoji: "🎯",
      title: s.chooseCategory,
      titleAlign: MainAxisAlignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: SelectCategories(categories: categories),
      ).asGlass(clipBorderRadius: BorderRadius.circular(12.r)),
    );
  }
}
