// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../../../../../const_data/data.dart';
import '../cards/analysis_chart_card.dart';
import '../cards/analysis_balance_card.dart';
import '../../../manager/analysis_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../layout/presentation/pages/widgets/custom_skeletonizer.dart';

class AnalysisBody extends StatelessWidget {
  final bool isOpen;
  final double startSized;
  const AnalysisBody({super.key, this.isOpen = false, this.startSized = 20});

  @override
  Widget build(BuildContext context) {
    var analysisCubit = AnalysisCubit.get(context);
    final s = S.of(context);
    return Column(
      children: [
        SizedBox(height: startSized),
        AnalysisChartCard(),
        CustomSkeletonizer(
          enable: analysisCubit.analysisLoading,
          child: AnalysisBalanceCard(
            emoji: "💸",
            title: s.income,
            color: incomeColor,
            models: analysisCubit.analysisIncomes,
            amount: analysisCubit.totalIncome,
          ),
        ),
        CustomSkeletonizer(
          enable: analysisCubit.analysisLoading,
          child: AnalysisBalanceCard(
            emoji: "🛒",
            title: s.expense,
            color: expenseColor,
            models: analysisCubit.analysisExpenses,
            amount: analysisCubit.totalExpense,
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
