import 'add_transactions_view.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/category_model.dart';

class AddIncomeView extends StatelessWidget {
  const AddIncomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AddTransactionsView(
      title: s.addIncomeTitle,
      subTitle: s.addIncomeSubTitle,
      brief: s.notesIncomeBrief,
      amountTitle: s.enterIncomeAmount,
      value: TextEditingController(),
      onChanged: (value) {},
      onTap: () {},
      categoryIndex: 0,
      dateController: TextEditingController(),
      briefController: TextEditingController(),
      categories: incomeCategoriesData,
    );
  }
}
