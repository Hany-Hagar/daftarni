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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        var categories =
            cubit.searchingOpen
                ? cubit.searchCategories
                : cubit.filteringOpen
                ? cubit.filterCategories
                : cubit.categories;
        return LayoutCubit.get(context).isLoadingCategory
            ? const _LoadingItems()
            : categories.isEmpty
            ? Empty(state: EState.list)
            : _Categories(categories: categories);
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
      child: _Categories(
        categories: List.generate(9, (index) => loadingCategoryModel),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  final List<CategoryModel> categories;
  const _Categories({required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {},
            child: _Item(model: categories[index]),
          ),
    );
  }
}

class _Item extends StatelessWidget {
  final CategoryModel model;
  const _Item({required this.model});

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    final langId = cubit.data.preferences.langI;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      decoration: BoxDecoration(
        boxShadow: defaultBoxShadow,
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).scaffoldBackgroundColor,
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
