// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

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
      nextPage: SizedBox(),
    ),
    QuickActionModel(
      title: s.recordIncome,
      icon: Icons.arrow_downward_outlined,
      color: const Color(0xff17c0eb).value,
      nextPage: SizedBox(),
    ),

    QuickActionModel(
      title: s.manageCategories,
      icon: Icons.sell_outlined,
      color: const Color(0xff8e24aa).value,
      nextPage: SizedBox(),
    ),
  ];
}
