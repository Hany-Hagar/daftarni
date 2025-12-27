import 'analysis_chart.dart';
import 'package:glass/glass.dart';
import 'analysis_chart_data.dart';
import 'package:flutter/material.dart';
import '../../../manager/analysis_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/utils/empty.dart';
import '../../../../../../core/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisChartCard extends StatelessWidget {
  const AnalysisChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var data = AnalysisCubit.get(context);

    return CustomCard(
      emoji: "📊",
      title: s.balanceAnalysis,
      child: Column(
        children: [
          data.analysisIncomes.isEmpty && data.analysisExpenses.isEmpty
              ? Empty(state: EState.home)
              : _Chart(),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: AnalysisChartData(),
          ),
        ],
      ).asGlass(clipBorderRadius: BorderRadius.circular(8.r)),
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var analysisCubit = AnalysisCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: AnalysisChart(
                title: s.income,
                transactions: analysisCubit.analysisIncomes,
              ),
            ),
            Expanded(
              child: AnalysisChart(
                title: s.expense,
                transactions: analysisCubit.analysisExpenses,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
