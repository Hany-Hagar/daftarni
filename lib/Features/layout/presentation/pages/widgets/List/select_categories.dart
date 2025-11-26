// ignore_for_file: deprecated_member_use

import '../custom_icon.dart';
import '../custom_skeletonizer.dart';
import '../../../../../../const/app.dart';
import 'package:flutter/material.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../../const/data.dart';
import '../../../../../../core/utils/empty.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/category_model.dart';
import '../../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/services/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  const SelectCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return LayoutCubit.get(context).isLoadingCategory
            ? const _LoadingItems()
            : categories.isEmpty
            ? Empty(state: EState.list)
            : SelectCategoryItems(categories: categories);
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
        categories: List.generate(9, (index) => loadingCategoryModel),
      ),
    );
  }
}

class SelectCategoryItems extends StatelessWidget {
  final List<CategoryModel> categories;
  const SelectCategoryItems({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              cubit.setTransactionCategory(index);
              Navigator.pop(context);
            },
            child: _Item(
              isSelector: index == cubit.transactionCategory,
              model: categories[index],
            ),
          ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isSelector;
  final CategoryModel model;
  const _Item({required this.isSelector, required this.model});

  @override
  Widget build(BuildContext context) {
    var langId = ServiceLocator.getDataModel().preferences.langI;
    return Container(
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
          CustomIcon(color: model.color, icon: model.icon.toIconData),
          SizedBox(height: 10.h),
          CustomText(
            isHead: true,
            maxLines: 1,
            fontSize: model.title[langId].length > 10 ? 14.5 : 18,
            title: model.title[langId],
          ),
        ],
      ),
    );
  }
}
