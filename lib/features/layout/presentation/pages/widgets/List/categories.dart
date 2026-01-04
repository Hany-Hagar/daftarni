// ignore_for_file: deprecated_member_use

import '../custom_icon.dart';
import '../custom_skeletonizer.dart';
import 'package:flutter/material.dart';
import '../../../../../../const_data/app.dart';
import '../../views/add_category_view.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../../const_data/data.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../core/utils/dialog_services.dart';
import '../../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  final bool isIncome;
  final List<CategoryModel> categories;
  const Categories({
    super.key,
    required this.isIncome,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return LayoutCubit.get(context).loadingAddCategory
            ? const _LoadingItems()
            : categories.isEmpty
            ? Empty(state: EState.list)
            : SelectCategoryItems(isIncome: isIncome, categories: categories);
      },
    );
  }
}

class _LoadingItems extends StatelessWidget {
  const _LoadingItems();

  @override
  Widget build(BuildContext context) {
    return CustomSkeletonizer(
      enable: true,
      child: SelectCategoryItems(
        isIncome: true,
        categories: List.generate(9, (index) => loadingCategoryModel),
      ),
    );
  }
}

class SelectCategoryItems extends StatelessWidget {
  final bool isIncome;
  final List<CategoryModel> categories;
  const SelectCategoryItems({
    super.key,
    required this.isIncome,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length + 1,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        if (index == categories.length) {
          return _AddCategoryButton(isIncome: isIncome);
        } else {
          return _Item(index: index, model: categories[index]);
        }
      },
    );
  }
}

class _AddCategoryButton extends StatelessWidget {
  final bool isIncome;
  const _AddCategoryButton({required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DialogServices.showCleanDialog(
          context: context,
          child: AddCategoryView(isIncome: isIncome),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 24.sp),
            SizedBox(height: 5.h),
            CustomText(
              maxLines: 2,
              isHead: true,
              textHeight: 1,
              fontSize: 18.sp,
              title: S.of(context).addNewCategory,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final int index;
  final CategoryModel model;
  const _Item({required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    var langId = cubit.data.preferences.langI;
    var isSelector = index == cubit.transactionCategoryIndex;

    return GestureDetector(
      onTap: () {
        cubit.setTransactionCategory(index);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: defaultBoxShadow,
          border:
              isSelector
                  ? Border.all(
                    color: Color(model.color).withOpacity(0.35),
                    width: 2.0,
                  )
                  : null,
          color:
              isSelector
                  ? Color(model.color).withOpacity(0.3)
                  : Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(color: model.color, icon: model.icon.toIconData()),
            SizedBox(height: 10.h),
            CustomText(
              isHead: true,
              maxLines: 1,
              fontSize: model.title[langId].length > 10 ? 14.5 : 18,
              title: model.title[langId],
            ),
          ],
        ),
      ),
    );
  }
}
