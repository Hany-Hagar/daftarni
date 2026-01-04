import 'package:flutter/material.dart';
import '../../../../../../const_data/app.dart';
import '../../../manager/analysis_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../manager/analysis_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/nav_pop_icon.dart';
import '../../../../../../core/utils/dialog_services.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class AnalysisAppBar extends StatelessWidget {
  const AnalysisAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: defaultAppBarPadding,
      decoration: BoxDecoration(gradient: redLinearGradient),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        tileColor: Colors.transparent,
        leading: NavPopIcon(),
        title: CustomText(
          isHead: true,
          title: s.transactionsAnalysis,
          fontSize: 30,
          fontColor: Colors.white,
        ),
        trailing: _FilterIcon(),
      ),
    );
  }
}

class _FilterIcon extends StatelessWidget {
  const _FilterIcon();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FloatingActionButton(
        heroTag: "filter",
        backgroundColor: theme.scaffoldBackgroundColor,
        mini: true,
        onPressed: () {
          final parentContext = context;
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            useSafeArea: false,
            constraints: BoxConstraints(maxWidth: double.infinity),
            backgroundColor: Theme.of(context).cardColor,
            builder:
                (context) => BlocProvider.value(
                  value: AnalysisCubit.get(parentContext),
                  child: _FilterBody(),
                ),
          );
        },
        child: Icon(
          Icons.filter_alt_outlined,
          size: 25.sp,
          color: theme.hintColor,
        ),
      ),
    );
  }
}

class _FilterBody extends StatelessWidget {
  const _FilterBody();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AnalysisCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: double.infinity),
          _FilterTop(),
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
      ),
    );
  }
}

class _FilterTop extends StatelessWidget {
  const _FilterTop();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AnalysisCubit.get(context);
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
      ],
    );
  }
}

class _FilterDate extends StatelessWidget {
  const _FilterDate();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<AnalysisCubit, AnalysisStates>(
      builder: (context, state) {
        var cubit = AnalysisCubit.get(context);
        List titles = [cubit.startFilterDate, cubit.endFilterDate];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            CustomText(isHead: true, title: s.date),
            SizedBox(height: 10.h),
            BlocBuilder<AnalysisCubit, AnalysisStates>(
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
