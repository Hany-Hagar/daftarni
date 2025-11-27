import '../../../../../const/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'filter/filter_bottom_sheet.dart';
import '../../manager/layout_cubit.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/nav_pop_icon.dart';
import '../../../../../core/widgets/text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchAppBar extends StatelessWidget {
  final String title;
  final String searchHint;
  final Widget? filterBody;
  final Function()? applyPressed;

  const CustomSearchAppBar({
    super.key,
    required this.title,
    required this.searchHint,
    this.filterBody,
    required this.applyPressed,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient,
        boxShadow: defaultBoxShadow,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 5.h),
          _Top(
            title: title,
            filterBody: filterBody,
            applyPressed: applyPressed,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: UTextFormField(
              hintText: searchHint,
              controller: cubit.searchText,
              prefixIcon: CupertinoIcons.search,
              suffixIcon: Icons.close_rounded,
              onChanged: (p0) => cubit.serachCategoriesData(),
              suffixTap: () => cubit.clearSearchData(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final String title;
  final Widget? filterBody;
  final Function()? applyPressed;

  const _Top({
    required this.title,
    this.filterBody,
    required this.applyPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        NavPopIcon(),
        Spacer(flex: 2),
        CustomText(
          isHead: true,
          title: title,
          fontSize: 35,
          fontColor: Colors.white,
        ),
        Spacer(flex: 3),
        FloatingActionButton(
          heroTag: "filter",
          backgroundColor: theme.scaffoldBackgroundColor,
          mini: true,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder:
                  (context) => FilterBottomSheet(
                    applyPressed: applyPressed,
                    body: filterBody,
                  ),
            );
          },
          child: Icon(
            Icons.filter_alt_outlined,
            size: 25.sp,
            color: theme.hintColor,
          ),
        ),
      ],
    );
  }
}
