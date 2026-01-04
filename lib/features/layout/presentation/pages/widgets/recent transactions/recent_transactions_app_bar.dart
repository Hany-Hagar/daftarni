import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../const_data/app.dart';
import '../../../manager/layout_cubit.dart';
import '../../../manager/layout_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/nav_pop_icon.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/toggle_button.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class RecentTransactionsAppBar extends StatelessWidget {
  final String title;
  final String searchHint;

  const RecentTransactionsAppBar({
    super.key,
    required this.title,
    required this.searchHint,
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
          _Top(title: title),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: UTextFormField(
              hintText: searchHint,
              controller: cubit.searchController,
              prefixIcon: CupertinoIcons.search,
              suffixIcon: Icons.close_rounded,
              suffixTap: () => cubit.clearSearch(),
              onChanged: (p0) => cubit.search(),
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

  const _Top({required this.title});

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
              showDragHandle: true,
              isScrollControlled: true,
              useSafeArea: false,
              constraints: BoxConstraints(maxWidth: double.infinity),
              backgroundColor: Theme.of(context).cardColor,
              builder: (context) => _FilterBody(),
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

class _FilterBody extends StatelessWidget {
  const _FilterBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: double.infinity),
        _FilterTop(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: _FilterAction(),
        ),
      ],
    );
  }
}

class _FilterTop extends StatelessWidget {
  const _FilterTop();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = LayoutCubit.get(context);
    return Column(
      children: [
        CustomText(isHead: true, textHeight: 0.1, title: s.searchOptions),
        SizedBox(height: 15.h),
        if (cubit.filterOpening)
          GestureDetector(
            onTap: () {
              cubit.clearFilter();
              NavTo.pop(context);
            },
            child: CustomText(
              title: s.clearFilterData,
              fontSize: 18,
              fontColor: Theme.of(context).primaryColor,
            ),
          ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class _FilterAction extends StatelessWidget {
  const _FilterAction();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    List<String> types = [s.all, s.income, s.expense];
    var cubit = LayoutCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.categoryType),
        SizedBox(height: 10.h),
        BlocBuilder<LayoutCubit, LayoutStates>(
          builder:
              (context, state) => MToggleButton(
                texts: types,
                currentSelect: cubit.filterCategory,
                width: MediaQuery.of(context).size.width - 28.w,
                onPressed: (tap) => cubit.setFilterCategory(index: tap),
              ),
        ),
        _FilterDate(),
        CustomButton(
          onPressed: () {
            cubit.applyFilter();
            NavTo.pop(context);
          },
          text: s.apply,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}

class _FilterDate extends StatelessWidget {
  const _FilterDate();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        List titles = [cubit.startFilterDate, cubit.endFilterDate];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            CustomText(isHead: true, title: s.date),
            SizedBox(height: 10.h),
            BlocBuilder<LayoutCubit, LayoutStates>(
              builder:
                  (context, state) => Row(
                    spacing: 10.w,
                    children: List.generate(
                      2,
                      (index) => Expanded(
                        child: CustomButton(
                          borderColorOnly: true,
                          onPressed:
                              () async => cubit.setFilterDate(
                                index: index,
                                date: await DialogServices.datePicker(
                                  context: context,
                                  initialDate: titles[index],
                                  firstDate: cubit.generalStartFilterDate,
                                  lastDate: cubit.generalEndFilterDate,
                                ),
                              ),
                          text: cubit.setFilterDateTitle(
                            s: s,
                            time: titles[index],
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
