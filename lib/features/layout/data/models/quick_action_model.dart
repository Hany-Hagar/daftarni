// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../analysis/presentation/views/pages/analysis_view.dart';
import '../../presentation/pages/views/add transaction/add_income_view.dart';
import '../../presentation/pages/views/add transaction/add_expense_view.dart';

class QuickActionModel {
  final String title;
  final IconData icon;
  final int color;
  final Widget nextPage;

  QuickActionModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.nextPage,
  });
}

List<QuickActionModel> quickActions({required BuildContext context}) {
  final s = S.of(context);
  return [
    QuickActionModel(
      title: s.addNewExpense,
      icon: Icons.add,
      color: const Color(0xffee5a24).value,
      nextPage: AddExpenseView(),
    ),
    QuickActionModel(
      title: s.recordIncome,
      icon: Icons.arrow_downward_outlined,
      color: const Color(0xff17c0eb).value,
      nextPage: AddIncomeView(),
    ),
    QuickActionModel(
      title: s.transactionsAnalysis,
      icon: Icons.analytics_outlined,
      color: const Color(0xff05c46b).value,
      nextPage: AnalysisView(),
    ),
  ];
}
